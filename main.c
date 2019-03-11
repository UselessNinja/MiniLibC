/*
** EPITECH PROJECT, 2019
** ASM_minilibc_2018
** File description:
** main
*/

#include <stdio.h>

int main(void)
{
   int len;
   const char str1[] = "ABCDEF4960910";
   const char str2[] = "013";

   len = strcspn(str1, str2);

   printf("First matched character is at %d\n", len + 1);
   
   return(0);
}