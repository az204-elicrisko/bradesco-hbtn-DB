public class UsuarioOperations {

    private MongoCollection<Document> docsusuarios;

    public UsuarioOperations(MongoDBConnection connection) {
        this.docsusuarios = connection.getDatabase().getCollection("usuarios");
    }

    public void initUsuario() {
        Usuario usuario1 = new Usuario("Alice", 25);
        Usuario usuario2 = new Usuario("Bob", 30);
        Usuario usuario3 = new Usuario("Charlie", 35);

        docsusuarios.insertMany(java.util.Arrays.asList(usuario1.toDocument(), usuario2.toDocument(), usuario3.toDocument()));

    }

    public void readUsuarios() {
        for (Document doc : docsusuarios.find()) {
            System.out.println(com.example.Usuario.fromDocument(doc));
        }
    }

    public void updateUsuario(Usuario usuario){
        docsusuarios.updateOne(Filters.eq("nome", usuario.getNome()), Updates.set("idade", usuario.getIdade()));
    }

    public void deleteUsuario(String nome){
        docsusuarios.deleteOne(Filters.eq("nome", nome));
    }

}
