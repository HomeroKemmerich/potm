trajeto = read.table("trajetos_aopa.txt")
trajeto = cbind2(trajeto,0)
cidades = c("Araguari", "Araxa", "Patos de Minas", "Patrocinio", "Uberaba", "Uberlandia", "Belo Horizonte")

# trajeto = read.table("trajetos_aopa2.txt")
# trajeto = cbind2(trajeto,0)
# cidades = c("Aveiro", "Badajos", "Cordoba", "Evora", "Faro", "Madri")

num_cidades = length(cidades)
num_trajetos = ((num_cidades**2)-num_cidades)/2

ocorrencia = array(0, dim=c(num_cidades))
cid_visitadas = array(0,dim=c(num_cidades,2))
distancia = 0
caminhos = 0

for (i in 1:num_trajetos)
{
  ocorrencia[trajeto[i,1]] = ocorrencia[trajeto[i,1]] + 1
  ocorrencia[trajeto[i,2]] = ocorrencia[trajeto[i,2]] + 1
  distancia = distancia + trajeto[i,3]
#  tam = length(which(ocorrencia==2))
  caminhos = caminhos + 1
    
  if ((ocorrencia[trajeto[i,1]] < 2) & (ocorrencia[trajeto[i,2]] < 2))
    {
      visita = TRUE
    }
  
  if ((ocorrencia[trajeto[i,1]] == 2) & (ocorrencia[trajeto[i,2]] < 2))
    {
      visita = TRUE
    }
   
  if ((ocorrencia[trajeto[i,1]] < 2) & (ocorrencia[trajeto[i,2]] == 2))
    {
      visita = TRUE
    } 
  
  if ((ocorrencia[trajeto[i,1]] > 2) | (ocorrencia[trajeto[i,2]] > 2))
    {
      visita = FALSE
    }
  
  if ((ocorrencia[trajeto[i,1]] == 2) & (ocorrencia[trajeto[i,2]] == 2))
    {
      if(caminhos == num_cidades)
        {
          visita = TRUE
        }
    }
  
  if (visita == TRUE)
  {
    trajeto[i,4] = 1
    cid_visitadas[trajeto[i,1],ocorrencia[trajeto[i,1]]] = trajeto[i,2]
    cid_visitadas[trajeto[i,2],ocorrencia[trajeto[i,2]]] = trajeto[i,1]
    print(c(cidades[trajeto[i,1]],cidades[trajeto[i,2]],trajeto[i,3]))
  }
  else
  {
    ocorrencia[trajeto[i,1]] = ocorrencia[trajeto[i,1]] - 1
    ocorrencia[trajeto[i,2]] = ocorrencia[trajeto[i,2]] - 1
    distancia = distancia - trajeto[i,3]
    caminhos = caminhos - 1 
  }
}  
print(c("Total distancia percorrida = ",distancia))
