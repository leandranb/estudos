# Mentor de Estudos para Concursos

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

## Prompt
O prompt usado para gerar a análise do edital (Etapa 1) está em `PROMPT.md`.
