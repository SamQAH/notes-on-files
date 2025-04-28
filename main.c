#include<stdio.h>
#include<string.h>
#include<stdlib.h>

int main(int argsc, char **argsv){
 char *path = argsv[1];
 int pathlen = strlen(path);
 int pwdlen = strlen(argsv[2]);
 char *temp = malloc((pathlen + pwdlen + 10) * sizeof(char));
 strcpy(temp, argsv[2]);
 strcat(temp, "/");
 if(path[0] == '.' && path[1] == '/'){
  strcat(temp, path+2);
  path = temp;
 }else if(path[0] == '/'){
  strcpy(temp, path);
  path = temp;
 }else if(path[1] != '/'){
  strcat(temp, path);
  path = temp;
 }
 int len = strlen(path);
 for(int i = 0; i < len; i++){
  if(path[i] == '/'){
   path[i] = '-';
  }
 }
 printf("%s\n", path);
 free(temp);
}
