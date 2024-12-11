# Conceitos de complexidade de algoritmos

**1. O que é uma Árvore Geradora Mínima (AGM)?**

A Árvore Geradora Mínima (AGM) é a menor árvore que abrange todos os vértices de um grafo.
Pode ser obtida através dos algoritmos de Kruskal ou de Prim.
Suas aplicações práticas incluem o projeto de redes de comunicação e construção de rodovias intermunicipais.

**2. Qual a diferença entre um algoritmo recursivo e um algoritmo iterativo? Quais são suas vantagens e desvantagens?**

Algoritmos recursivos dividem um problema em porções menores e idênticos até chegar a um caso base[^1]. Algoritmos iterativos repetem um conjunto de instruções até que uma condição seja satisfeita.
A recursividade é elegante, mas pode ser menos eficiente em razão do excesso de chamadas de função. A iteração, por sua vez, é mais eficiente, mas pode ser menos legível.

**3. Por que um algoritmo iterativo possui complexidade $O(n)$?**

Isso ocorre porque o conteúdo do laço possui complexidade constante ($O(1)$) e é repetido $n$ vezes.

[^1]: até que seja impossibilitado de continuar.

