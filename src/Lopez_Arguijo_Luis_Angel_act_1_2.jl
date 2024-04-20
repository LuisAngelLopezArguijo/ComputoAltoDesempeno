#Un arreglo es una secuencia
[10, 20, 30, 40]
["abadejo", "falsía", "estrambote"]

#Un arreglo que no contiene elementos se llama arreglo vacío y se puede crear uno con corchetes vacíos, []
#Como es de esperar, se pueden asignar valores de arreglos a variables:
julia> quesos = ["Cheddar", "Edam", "Gouda"];

julia> numeros = [42, 123];

julia> vacio = [];

julia> print(quesos, " ", numeros, " ", vacio)
["Cheddar", "Edam", "Gouda"] [42, 123] Any[]

#La función typeof se puede usar para conocer el tipo del arreglo:
julia> typeof(quesos)
Array{String,1}
julia> typeof(numeros)
Array{Int64,1}
julia> typeof(vacio)
Array{Any,1}

#Los arreglos son mutables
julia> quesos[1]
"Cheddar"

#El operador ∈ también funciona en arreglos:
julia> "Edam" ∈ quesos
true
julia> "Brie" in quesos
false

#Recorriendo un Arreglo
for queso in quesos
    println(queso)
end

#Esto funciona bien si solo se necesita leer los elementos del arreglo, 
#pero si se desea escribir o actualizar los elementos es necesario utilizar índices. 
#Una forma común de hacerlo es usando la función integrada eachindex:
for i in eachindex(numeros)
    numeros[i] = numeros[i] * 2
end

#Porciones de arreglos
julia> t = ['a', 'b', 'c', 'd', 'e', 'f'];

julia> print(t[1:3])
['a', 'b', 'c']
julia> print(t[3:end])
['c', 'd', 'e', 'f']

#Librería de Arreglos
julia> t = ['a', 'b', 'c'];

julia> push!(t, 'd');

julia> print(t)
['a', 'b', 'c', 'd']

#sort! ordena los elementos de un arreglo de menor a mayor:
julia> t = ['d', 'c', 'e', 'b', 'a'];

julia> sort!(t);

julia> print(t)
['a', 'b', 'c', 'd', 'e']

#Un Diccionario es un Mapeo
#La función Dict crea un nuevo diccionario sin elementos. 
#Como Dict es el nombre de una función integrada de Julia, debe evitar usarla como nombre de variable.
julia> ing_a_esp = Dict()
Dict{Any,Any}()

#El diccionario está vacío. Para agregar elementos a él, se pueden usar corchetes:
julia> ing_a_esp["one"] = "uno";

#Este formato de salida también es un formato de entrada.
#Por ejemplo, se puede crear un nuevo diccionario con tres ítems de la siguiente manera:
julia> ing_a_esp = Dict("one" => "uno", "two" => "dos", "three" => "tres")
Dict{String,String} with 3 entries:
  "two"   => "dos"
  "one"   => "uno"
  "three" => "tres"

#Diccionario como una Colección de Frecuencias
function histograma(s)
    d = Dict()
    for c in s
        if c ∉ keys(d)
            d[c] = 1
        else
            d[c] += 1
        end
    end
    d
end

#Iteración y Diccionarios
function imprimirhist(h)
    for c in keys(h)
        println(c, " ", h[c])
    end
end

#Las Tuplas son Immutables
julia> t = 'a', 'b', 'c', 'd', 'e'
('a', 'b', 'c', 'd', 'e')

#Asignación de tupla
temp = a
a = b
b = temp

#El lado derecho puede ser cualquier tipo de secuencia (cadena, arreglo o tupla). 
#Por ejemplo, para dividir una dirección de correo electrónico en nombre de usuario y dominio, se puede escribir:
julia> addr = "julio.cesar@roma"
"julio.cesar@roma"
julia> unombre, dominio = split(addr, '@');

#Tuplas como valor de retorno
julia> t = divrem(7, 3)
(2, 1)

#Tupla con Argumentos de Longitud Variable
function imprimirtodo(args...)
    println(args)
end

#Arreglos y tuplas
#zip es una función integrada que toma dos o más secuencias y devuelve una colección de tuplas donde
#cada tupla contiene un elemento de cada secuencia. 
#El nombre de la función se refiere a una cremallera, que une e intercala dos filas de dientes.
julia> s = "abc";

julia> t = [1, 2, 3];

julia> zip(s, t)
zip("abc", [1, 2, 3])

#Escogí estos porque se me hicieron los mas importantes para usar en los codigos que usaré en Julia