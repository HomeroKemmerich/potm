/* +---------------------------------------------+
| Programa que determina o passeio do cavalo |
| num tabuleiro de xadrez de dimensões n x n |
| onde n é fornecido pelo usuário |
| Implementado por Marcus Vinícius A. Andrade |
| em 28/02/02 |
+---------------------------------------------+ */
#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <cstring>

using namespace std;

int n;
struct desloc // deslocamentos nas direções x e y
{
   int dx;
   int dy;
};

// vetor de deslocamentos que define os possíveis
// movimentos do cavalo no tabuleiro de xadrez
desloc mov_cav[8]={{2, 1},{1, 2},{-1, 2},{-2, 1},{-2,-1},{-1,-2},{1,-2},{2,-1}};

int **T; // tabuleiro
int nsq; // número de posiçoes no tabuleiro n^2

bool tente_mov(int i, int x, int y)
{
   int u,v; // posição do próximo movimento
   bool q; // true => movimento com sucesso
   int k;
   k=0;
   do
   {
      q=false;
      u = x+mov_cav[k].dx;
      v = y+mov_cav[k].dy;
      k=k+1;

     // verifica se a posição é válida no tabuleiro
     // e se a posição ainda não foi visitada
     if (0 <= u && u < n && 0 <= v && v < n && T[u][v]==0)
     {
        T[u][v]=i; // registra a visita
        if (i < nsq)
        {
           // ainda há posições no tabuleiro não visitadas
           q = tente_mov(i+1,u,v);
           if (!q) // movimento sem sucesso
             T[u][v]=0; // remova o registo de "visita"
        }
        else q=true;
      }
   }while (!q && k<8);

   return q;
}

int main()
{
   bool ok;
   cout << "Tamanho do tabuleiro = ";
   cin >> n;
//   fflush(stdin);

   nsq = n*n;
   // Aloca espaço para o tabuleiro
   T=new (int* [n]);
   for (int i=0; i < n; i++)
     T[i]=new (int[n]);

   for (int i=0; i < n; i++)
     for (int j=0; j < n; j++)
       T[i][j]=0;


   T[0][0] = 1; // posicao inicial do cavalo no tabuleiro
   ok = tente_mov(2,2,1);
   if (ok)
   {
      cout.setf(ios::right);
      for (int i=0; i < n; i++)
      {
         for (int j=0; j < n; j++)
           cout << setw(4) << T[i][j] << " ";
         cout << endl;
      }
    }
    else
      cout << "Nao ha solucao \n";

//    getchar();
    return 0;
}
