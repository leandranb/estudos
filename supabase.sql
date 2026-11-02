-- Mentor de Estudos: tabela de sincronização entre aparelhos.
-- Rode uma vez no Supabase: SQL Editor → New query → cole tudo → Run.

create table if not exists public.estado_estudos (
  user_id    uuid primary key default auth.uid() references auth.users(id) on delete cascade,
  dados      jsonb  not null,
  atualizado bigint not null,              -- carimbo (ms) da última alteração
  updated_at timestamptz not null default now()
);

-- Cada pessoa só enxerga e altera a própria linha.
alter table public.estado_estudos enable row level security;

drop policy if exists "dono le"       on public.estado_estudos;
drop policy if exists "dono insere"   on public.estado_estudos;
drop policy if exists "dono atualiza" on public.estado_estudos;

create policy "dono le"       on public.estado_estudos for select to authenticated using (auth.uid() = user_id);
create policy "dono insere"   on public.estado_estudos for insert to authenticated with check (auth.uid() = user_id);
create policy "dono atualiza" on public.estado_estudos for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);

create or replace function public.estado_estudos_touch() returns trigger language plpgsql as $$
begin new.updated_at := now(); return new; end $$;
drop trigger if exists estado_estudos_touch on public.estado_estudos;
create trigger estado_estudos_touch before update on public.estado_estudos
  for each row execute function public.estado_estudos_touch();
