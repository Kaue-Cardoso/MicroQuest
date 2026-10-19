# AGENTS.md

## Projeto
Este é um projeto Godot 4.x usando GDScript.
O objetivo é manter o código simples, didático e fácil de evoluir.

## Regras gerais
- Antes de alterar um sistema, analise a estrutura atual.
- Preserve funcionalidades que já estejam funcionando.
- Prefira alterações pequenas e incrementais.
- Não reorganize arquivos sem necessidade.
- Não crie Autoloads ou dependências externas sem justificar.

## Godot
- Prefira composição a heranças profundas.
- Prefira Signals para comunicação desacoplada.
- Use Resources para dados reutilizáveis quando apropriado.
- Use CharacterBody2D para personagens com movimento e colisão.
- Use Area2D para áreas de detecção.
- Separe lógica de gameplay da interface.
- Evite caminhos frágeis como get_parent().get_parent().

## Desenvolvimento
Ao receber uma tarefa:
1. analise arquivos e cenas relacionados;
2. planeje alterações arquiteturais relevantes;
3. implemente;
4. atualize cenas e scripts;
5. execute o projeto;
6. verifique erros;
7. corrija erros encontrados;
8. informe os arquivos modificados.

## Testes
- Execute o jogo após alterações relevantes.
- Procure erros de parsing e runtime.
- Verifique se funcionalidades existentes continuam funcionando.
- Quando não for possível validar automaticamente, informe o teste manual necessário.

## Git e segurança
- Não apague arquivos importantes sem confirmar que não são utilizados.
- Evite modificar arquivos não relacionados à tarefa.
- Não faça commits, pushes ou alterações remotas sem solicitação explícita.

## Objetivo educacional
Explique brevemente sistemas importantes criados e os conceitos da Godot envolvidos.
Priorize, nesta ordem: funcionamento, clareza, manutenibilidade, simplicidade e performance.
