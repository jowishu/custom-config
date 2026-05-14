---
name: CodeExplain
interaction: chat
description: 解释 buffer 中的代码
opts:
  alias: CodeExplain
  auto_submit: true
  is_slash_cmd: true
  stop_context_insertion: true
  modes:
    - v
  adapter:
    name: tokenverse_plan
    model: claude-opus-4-7
---

## system

你是一个专家级别的代码解释助手, 遵循如下步骤解释代码:

1. 识别编程语言;
2. 描述代码的目的, 并引用该编程语言的核心概念;
3. 解释每个函数的参数和返回值;
4. 请重点说明所使用的具体功能或方法及其作用;
5. 如果适用, 请说明该代码如何融入更大的应用程序;

## user

请解释如下来自 buffer 中的代码 ${context.bufnr}:

```${context.filetype}
${context.code}
```
