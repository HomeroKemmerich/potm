#include <iostream>
#include <algorithm>

using namespace std;

#define n 5

float MochilaFracionaria(float valor[], float peso[], float capacidade, int ord[])
{
    float v_total = 0;
    int i = 0;

    while(capacidade >= peso[ord[i]])
    {
       v_total += valor[ord[i]];
       capacidade -= peso[ord[i]];
       i++;
    }
    v_total += (capacidade/peso[ord[i]]) * valor[ord[i]];

    return (v_total);
}

int main()
{
    float valor_capacidade = 30;
    float valor_item[] = {8, 5, 10, 15, 7};
    float valor_pesos[] = {6, 10, 9, 5, 12};
    float valor_relacao[n];
    int ordem[n], pos;

    for (int i = 0; i < n; i++)
        valor_relacao[i] = valor_item[i]/valor_pesos[i];

    for (int i = 0; i < n; i++)
    {
      pos = distance(valor_relacao, max_element(valor_relacao, valor_relacao+n));
      ordem[i] = pos;
      valor_relacao[pos] = 0.0;
    }

    float resposta = MochilaFracionaria(valor_item, valor_pesos, valor_capacidade, ordem);
    cout << "Valor = " << resposta;
    return 0;

}
