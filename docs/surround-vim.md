# 在字串增補引號操作

將以下指令漏加之「雙引號」補上：

```
printf(text goes here);
```

改成：

```
printf("text goes here");
```

## 【方法一】：使用 Vim 搜尋與置換指令（搭配 RegEx 正規式）

1. 選取文字：

   printf(`text goes here)`;

2. 使用指令補增 \" ：

   ```
   :'<, '>s/\%V\(.*\)\%V/"\1"/
   ```

To break that into parts:

- : allows you to enter ex commands.

- s/old/new/ is the usual substitute command.

- \%V is an under-documented atom to mark the beginning of the selected text

- \(.\*\) selects everything and save it into selection 1.

- The second \%V signifies the end of the selected text.

The replacement text is everyting that was selected, which is stored in \1, surrounded by quotes: "\1".

## 【方法二】：使用 surround.vim plugin

1. 選取文字：

   printf(`text goes here`);

2. 使用 surround 指令補增 \" ：

   - 按 [S] 鍵（注意！是大寫 s 字母）。
   - 按 ["] 鍵。

## 參考文件：

https://superuser.com/questions/782391/vim-enclose-in-quotes
