<!DOCTYPE html>
<html>
<body>
<?php

/*
    1 > Utilizando a variável $arrayDeClientes de umechono nome do 			segundo cliente.
*/
$nomes = ['Francisco Souza', 'Guilherme Rosa', 'Arthur Golveia'];

$cliente1 = new stdClass();
$cliente1->nome = $nomes[0];

$cliente2 = new stdClass();
$cliente2->nome = $nomes[1];

$cliente3 = new stdClass();
$cliente3->nome = $nomes[2];

$arrayDeClientes = [$cliente1, $cliente2, $cliente3];

echo "1 Cliente na posição 2. <br>";
echo "> ".$arrayDeClientes[1]->nome."<br>"; //posição 2
echo "<br>";

/*
	2 > Utilize a estrutura de dados $arrayDeNascimento para adicionar 		na estrutura $arrayDeClientes a data de nascimento de cada cliente.
*/
$arrayDeNascimento = [
  'Francisco Souza' => '10-12-1996',
  'Arthur Golveia' => '14-01-2000',
  'Guilherme Rosa' => '26-05-1985',
  'Marcelo Planalto' => '26-05-1985'
];

foreach($arrayDeClientes as $cliente) {
	$nome = $cliente->nome;
    
    if(array_key_exists($nome, $arrayDeNascimento)) {
    	$cliente->dataDeNascimento = $arrayDeNascimento[$nome];
    };
};

echo "2 Clientes com a data de nascimento. <br>";
foreach($arrayDeClientes as $cliente) {
	echo "> ".".Nome: ".$cliente->nome.", "."Data de nascimento: ".$cliente->dataDeNascimento."<br>";
};
echo "<br>";

/*
	3 > Faça a ordenação e impressão da estrutura $arrayDeClientes resultante do exercício 2 pela data de nascimento (pode ser ascendente ou descendente).
*/

$novoArrayDeDatas = [];
$novoArrayDeClientes = [];

//Preenche o array com as datas.
foreach($arrayDeClientes as $client) {
	array_push($novoArrayDeDatas, $client->dataDeNascimento);
}

//Ordena as datas no array.
function compararDatas($data1, $data2) {
	$dataConvertida1 = strtotime($data1);
    $dataConvertida2 = strtotime($data2);

    if ($dataConvertida1 < $dataConvertida2) {
        return 1;
    } elseif ($dataConvertida1 > $dataConvertida2) {
        return -1;
    } else {
        return 0;
    }
};

usort($novoArrayDeDatas, "compararDatas");

//Preenche o novo array com as datas ordenadas.
foreach($novoArrayDeDatas as $data) {
	foreach($arrayDeClientes as $cliente) {
    	if($cliente->dataDeNascimento == $data) {
        	array_push($novoArrayDeClientes, $cliente);
        };
    };
};

echo "3 Clientes com a data de nascimento ordenada. <br>";
foreach($novoArrayDeClientes as $cliente) {
	echo "> "."Nome: ".$cliente->nome.", "."Data de nascimento: ".$cliente->dataDeNascimento."<br>";
};


?>
</body>
</html>