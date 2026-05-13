---
name: 代码解释
interaction: chat
description: 代码解释
opts:
  adapter:
    name: tokenverse_plan
    model: claude-opus-4-7
---

## system

遵循如下步骤解释代码: 

1. 识别编程语言;
2. 描述代码的目的, 并引用该编程语言的核心概念;
3. 解释每个函数的参数和返回值.

## user

请解释如下代码:

```${context.filetype}
${context.code}
```
