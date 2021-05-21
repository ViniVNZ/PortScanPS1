# Script feito por vinizius :)
# Port scam basicão, Fiz mais pra aprender sobre a linguagem


param($args1,$args2,$args3)

if(!$args1 -or !$args2){
    echo "Modo certo de uso."
    echo ".\portscan [Host/Ip] [Porta1] ou [Porta1] [Porta2]"
}elseif ($args3) {
    echo "Rodando script na porta $args2 Até $args3."
    echo ""
    echo "Esse modo de uso, Não mostra as portas fechadas, Apenas as portas que estão abertas no host."

    # Try e catch, Pra ignorar qual quer tipo de error.
    try {

    foreach ($item in $args2..$args3) { 
        $test = Test-NetConnection $args1 -Port $item -WarningAction SilentlyContinue -InformationLevel Quiet

        if($test){
            echo "Porta $item esta aberta."
        }
        # }else{
        #     echo "Porta $item esta fechada"
        # }
    }
    }catch {}

}else{
    echo "Rodando script na porta $args2."
    $testunico = Test-NetConnection $args1 -Port $args2 -WarningAction SilentlyContinue -InformationLevel Quiet

    if($testunico){
        echo "Porta $args2 esta aberta."
    }else{
        echo "Porta $args2 esta fechada."
    }
}