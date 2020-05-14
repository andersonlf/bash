#!/bin/bash 

# obtem a lista de projetos com o nome curto, sem descricao
for a in $(oc projects --short); do { 

  if [ "$a" != "3scale" ];
  then

    # troca de projeto em silencio, por favor
    oc project "$a" --short > /dev/null

    ROUTES=$(oc get route | awk -F' ' '{print $1}')

    for b in "$ROUTES"; do {
        echo "$b";
    }; done


    # # obtem a lista de todos os routes em formato json
    # # usa jq para varrer a lista de itens
    # # usa jq para obter apenas a url
    # URL=$(oc get route --short -o json | jq .items[] | jq .spec.host)

    # # imprime apenas se houve alguma url
    # # formalmente imprime se url nao eh null
    # if [ "$URL" ];
    # then
    #     echo "$URL"
    # fi

  fi

}; done;