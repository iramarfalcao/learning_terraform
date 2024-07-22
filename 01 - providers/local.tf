# resource  -> Bloco
# local     -> Provider
# file      -> Tipo do Provider
# exemplo   -> Nome do Recurso
resource "local_file" "exemplo" {
    filename = "example.txt"
    content = "I'm a file content."
}