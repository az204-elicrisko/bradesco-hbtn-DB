public class Main {
    public static void main(String[] args) {
        MongoDBConnection connection = new MongoDBConnection();

        UsuarioOperations operations = new UsuarioOperations(connection);

        operations.initUsuario();
        operations.readUsuarios();
        Usuario usuario2 = new Usuario("Bob", 32);
        operations.updateUsuario(usuario2);
        operations.readUsuarios();
        operations.deleteUsuario("Charlie");
        operations.readUsuarios();

        connection.closeConnection();
    }
}