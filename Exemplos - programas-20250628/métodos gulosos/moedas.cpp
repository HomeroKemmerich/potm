#include <iostream>
#include <cmath>

using namespace std;

int contaMoeadasTroco(int moedas[], int valor)
{
    int nMoedas = 0;
    int i = 0;

    while(valor > 0)
    {
       if(valor >= moedas[i])
       {
           nMoedas += abs(valor / moedas[i]);
           valor = valor % moedas[i];
       }
       i++;
    }
    return (nMoedas);
}

int main()
{
    int v_moedas[] = {50, 25, 10, 5, 1};
    int troco = 330;

    int v_troco = contaMoeadasTroco(v_moedas,troco);
    cout << "Numero de moedas = " << v_troco;
    return 0;

}
