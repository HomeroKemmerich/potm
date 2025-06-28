/* +---------------------------------------------+
| Programa que determina o passeio do cavalo |
| num tabuleiro de xadrez de dimens�es n x n |
| onde n � fornecido pelo usu�rio |
| Implementado por Marcus Vin�cius A. Andrade |
| em 28/02/02 |
+---------------------------------------------+ */
#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <cstring>

using namespace std;

int n;
struct desloc // deslocamentos nas dire��es x e y
{
   int dx;
   int dy;
};

// vetor de deslocamentos que define os poss�veis
// movimentos do cavalo no tabuleiro de xadrez
desloc mov_cav[8]={{2, 1},{1, 2},{-1, 2},{-2, 1},{-2,-1},{-1,-2},{1,-2},{2,-1}};

int **T; // tabuleiro
int nsq; // n�mero de posi�oes no tabuleiro n^2

bool tente_mov(int i, int x, int y)
{
   int u,v; // posi��o do pr�ximo movimento
   bool q; // true => movimento com sucesso
   int k;
   k=0;
   do
   {
      q=false;
      u = x+mov_cav[k].dx;
      v = y+mov_cav[k].dy;
      k=k+1;

     // verifica se a posi��o � v�lida no tabuleiro
     // e se a posi��o ainda n�o foi visitada
     if (0 <= u && u < n && 0 <= v && v < n && T[u][v]==0)
     {
        T[u][v]=i; // registra a visita
        if (i < nsq)
        {
           // ainda h� posi��es no tabuleiro n�o visitadas
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
   // Aloca espa�o para o tabuleiro
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
