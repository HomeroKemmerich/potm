#distancias = read.table("trajetos_ams.txt", sep=",")
#nome_cidades = c("Araguari", "Araxa", "Patos de Minas", "Patrocinio", "Uberaba", "Uberlandia", "Belo Horizonte")

distancias = read.table("trajetos_ams2.txt", sep=",")
nome_cidades = c("Aveiro", "Badajos", "Cordoba", "Evora", "Faro", "Madri")

dimnames(distancias) <- list(nome_cidades,nome_cidades)
num_cidades = length(nome_cidades)

resposta = array(0, dim=c(num_cidades,(num_cidades+2)))
dimnames(resposta) <- list(nome_cidades, c(paste("C",1:(num_cidades+1),sep=""), "Total"))

for (i in 1:num_cidades)
{
  novas_distancias = distancias
  cid = i
  for (j in 1:num_cidades)
  {
    resposta[i,j] = cid
    cid_novo = which.min(novas_distancias[cid,])
    if (j != num_cidades) 
      resposta[i,(num_cidades+2)] = resposta[i,(num_cidades+2)] + novas_distancias[cid,cid_novo]
    else
      resposta[i,(num_cidades+2)] = resposta[i,(num_cidades+2)] + distancias[cid,i]
    novas_distancias[,cid] = NA
    cid = cid_novo
  }
}

resposta[,(num_cidades+1)] = resposta[,1]
menor = min(resposta[,(num_cidades+2)])
print(resposta)
final <- resposta[which(resposta[,(num_cidades+2)]==menor),]
names(final) <- c(nome_cidades[final[1:7]],"Distancia")
print(final)
