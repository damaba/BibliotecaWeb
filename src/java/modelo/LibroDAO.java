/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author David
 */
public class LibroDAO {
    public static ArrayList<Libro> consultarLibro(){
        Statement st;
        ResultSet res;
        ArrayList<Libro> libros = new ArrayList<>();
        
        String sql = "select * from libros JOIN autor ON libros.autor=autor.id_autor;";
  
        Conexion conexion = new Conexion();
        
        try {
            
            st = conexion.getConexion().createStatement(); 
            res = st.executeQuery(sql);
            while (res.next()){
                
                libros.add(new Libro(res.getInt("id_libro"),res.getString("titulo"),res.getInt("paginas"),res.getString("nombre")));
                
            }
            st.close();
            conexion.cerrarConexion();
        } catch (SQLException e) {
            System.out.println("Problemas durante la consulta en tabla libros");
            System.out.println(e);
            
        }

        return libros;  
    }
    
    public static int insertarLibro(String titulo,int paginas, int autor){
        
        // Cadena con la consulta parametrizada
        String sql = "insert into libros (titulo,paginas,autor) values (?,?,?)";

        Conexion conexion = new Conexion();
        
        PreparedStatement prest;

        try { 
            prest = conexion.getConexion().prepareStatement(sql);

            prest.setString(1, titulo);
            prest.setInt(2,paginas);
            prest.setInt(3,autor);

            // Ejecutamos la sentencia de inserción preparada anteriormente
            int nfilas = prest.executeUpdate();
    
            // Cerramos el recurso PreparedStatement 
            prest.close();
            
            // Cerramos la conexión 
            conexion.cerrarConexion();
            // La inserción se realizó con éxito, devolvemos filas afectadas
            return nfilas;
        } catch (SQLException e) {
            System.out.println("Problemas durante la inserción de datos en la tabla libros");
            System.out.println(e);
            return -1;
        }
    }
    
    /*public static ResultSet borrarLibro(int id){
        Statement st;
        ResultSet res = null;
        
        String sql = "delete from libros where id_libro='"+id+"'";
  
        Conexion conexion = new Conexion();
        
        try {
            
            
            st = conexion.getConexion().createStatement(); 
            res = st.executeQuery(sql);
            
            st.close();
            conexion.cerrarConexion();
        } catch (SQLException e) {
            System.out.println("Problemas durante la consulta en tabla libros");
            System.out.println(e);
            
        }
        return res;
    }*/
}
