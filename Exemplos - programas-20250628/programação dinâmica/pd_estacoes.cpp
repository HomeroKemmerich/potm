#include <iostream>

using namespace std;

#define estacoes 6 //número de estações de cada linha de montagem
#define linhas 2 //número de linha de montagens

int main()
{
    int a[linhas][estacoes]={{7,9,3,4,8,4},{8,5,6,4,5,7}};
    int t[linhas][estacoes]={{2,3,1,3,4,0},{2,1,2,2,1,0}};
    int e1=2, e2=4, x1=3, x2=2;
    int f1[estacoes]={0,0,0,0,0,0}, f2[estacoes]={0,0,0,0,0,0};
    int l[linhas][estacoes]={{0,0,0,0,0,0},{0,0,0,0,0,0}};
    int f, li;

    f1[0]=e1+a[0][0];
    f2[0]=e2+a[1][0];

    for (int j=1; j<estacoes; j++)
    {
        if ((f1[j-1]+a[0][j])<=(f2[j-1]+t[1][j-1]+a[0][j]))
        {
            f1[j] = f1[j-1] + a[0][j];
            l[0][j] = 0;
        }
        else
        {
            f1[j] = f2[j-1] +t[1][j-1] + a[0][j];
            l[0][j] = 1;
        }

        if ((f2[j-1]+a[1][j])<=(f1[j-1]+t[0][j-1]+a[1][j]))
        {
            f2[j] = f2[j-1] + a[1][j];
            l[1][j] = 1;
        }
        else
        {
            f2[j] = f1[j-1] +t[0][j-1] + a[1][j];
            l[1][j] = 0;
        }
    }

    if ((f1[estacoes-1]+x1)<=(f2[estacoes-1]+x2))
    {
        f = f1[estacoes-1]+x1;
        li = 0;
    }
    else
    {
        f = f2[estacoes-1]+x2;
        li = 1;
    }

    int i = li;
    cout << "linha " << i+1 << " estacao " << estacoes << endl;
    for (int j=estacoes-1; j>0; j--)
    {
        i = l[i][j];
        cout << "linha " << (i+1) << " estacao " << j << endl;
    }
}
