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
public class AutorDAO {
    public static ArrayList<Autor> consultarAutor(){
        Statement st;
        ResultSet res;
        ArrayList<Autor> autores = new ArrayList<>();
        
        String sql = "select * from autor;";
  
        Conexion conexion = new Conexion();
        
        try {
            
            st = conexion.getConexion().createStatement(); 
            res = st.executeQuery(sql);
            while (res.next()){
                
                autores.add(new Autor(res.getInt("id_autor"),res.getString("nombre")));
                
            }
            st.close();
            conexion.cerrarConexion();
        } catch (SQLException e) {
            System.out.println("Problemas durante la consulta en tabla libros");
            System.out.println(e);
            
        }

        return autores;  
    }
    
    public static int insertarAutor(String nombre){
        
        // Cadena con la consulta parametrizada
        String sql = "insert into autor (nombre) values (?)";

        Conexion conexion = new Conexion();
        
        PreparedStatement prest;

        try { 
            prest = conexion.getConexion().prepareStatement(sql);

            prest.setString(1, nombre);

            // Ejecutamos la sentencia de inserción preparada anteriormente
            int nfilas = prest.executeUpdate();
    
            // Cerramos el recurso PreparedStatement 
            prest.close();
            
            // Cerramos la conexión 
            conexion.cerrarConexion();
            // La inserción se realizó con éxito, devolvemos filas afectadas
            return nfilas;
        } catch (SQLException e) {
            System.out.println("Problemas durante la inserción de datos en la tabla autor");
            System.out.println(e);
            return -1;
        }
    }
}
