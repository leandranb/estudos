# Mentor de Estudos para Concursos

Plano atual: **SEFAZ ES — Auditor Fiscal da Receita Estadual**, com base no Edital nº 01/2021 (FGV), até o novo edital sair. Início em 01/12/2026, 26 semanas, 4h/dia (tudo editável no app).

App de planejamento de estudos que roda no navegador, em um único arquivo (`index.html`), sem instalar nada.

## Como abrir
Dê dois cliques em `index.html` (ou arraste o arquivo para o Chrome, Edge ou Firefox). Tudo o que você altera é salvo sozinho no navegador (localStorage).

## Como editar o plano (JSON)
Abra `index.html` num editor de texto e procure `<script id="dados-iniciais">`.
- `config`: concurso, banca, data de início, data da prova (`null` = a definir), semanas, horas/dia, pares de matérias que não ficam no mesmo dia (`paresProibidos`).
- `materias`: na ordem do edital, cada uma com `questoes`, `peso`, `incidencia` (`alta`/`media`/`baixa`), `cor` e `assuntos`.
- Para adicionar um assunto: `{"id": "port13", "nome": "Novo assunto", "incidencia": "media"}` na lista `assuntos` da matéria (o `id` não pode se repetir).

Depois de salvar o arquivo, abra o app e vá em **⚙ Configurações → Restaurar dados do arquivo** (isso apaga o progresso salvo no navegador, então exporte um backup antes).
Também dá para adicionar matérias, assuntos e tópicos direto pelo app, sem mexer no JSON.

## Backup
- **⬇ Exportar** baixa um `.json` com tudo (plano, status, registros de horas).
- **⬆ Importar** carrega esse arquivo de volta (em outro navegador ou computador, por exemplo).

## Sincronizar entre aparelhos (Supabase, opcional)
Sem isso o progresso fica só no navegador. Com isso, fica igual no celular e no computador.

1. **Tabela:** no Supabase, abra *SQL Editor → New query*, cole o conteúdo de `supabase.sql` e clique em *Run*.
2. **Login com senha:** em *Authentication → Sign In / Providers → Email*, desligue **Confirm email** (assim a conta funciona na hora, sem link).
3. **Chaves:** em *Project Settings → API* (ou *API Keys*), copie a **Project URL** e a chave **anon / publishable**. Nunca use a `service_role`/`secret`.
4. **No app** (pelo link do GitHub Pages): ⚙ → *Sincronização* → *Projeto Supabase*, cole URL e chave e salve. Ou deixe fixo no arquivo, em `SUPABASE_PADRAO` no começo do script.
5. Clique em **Sincronizar** no topo → **Criar conta** (e-mail + senha). Nos outros aparelhos, só **Entrar** com a mesma senha.
6. Depois de criar sua conta, feche novos cadastros em *Authentication → Sign In / Providers → Allow new users to sign up* (desligado).

Esqueceu a senha? Em *Authentication → Users*, abra seu usuário e defina uma nova.

Cada alteração é enviada ~1,5 s depois; ao voltar para a aba, o app busca o que há de mais novo. Se os dois aparelhos mudaram ao mesmo tempo, o app pergunta qual versão manter. O estado do pomodoro em andamento continua local.

## Prompt
O prompt usado para gerar a análise do edital (Etapa 1) está em `PROMPT.md`.
