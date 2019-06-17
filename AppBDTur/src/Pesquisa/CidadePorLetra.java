/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Pesquisa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author hital
 */
public class CidadePorLetra {

    
    public static void main(String[] args) {
        final String DRIVER = "com.mysql.jdbc.Driver";
        final String DATABASE_URL = "jdbc:mysql://localhost:3307/bdtur";
        final String SELECT_QUERY ="SELECT ID_Cidade, Nome, UF, Populacao FROM Cidade WHERE Nome like 'F%' ";
// usa try com recursos para conectar-se e consultar o banco de dados
        try ( 
        Connection connection = DriverManager.getConnection( 
            DATABASE_URL, "root", "root1234"); 
        Statement statement = connection.createStatement(); 
        ResultSet resultSet = statement.executeQuery(SELECT_QUERY)) 
        {
// obtém os metadados de ResultSet
        ResultSetMetaData metaData = resultSet.getMetaData();
        int numberOfColumns = metaData.getColumnCount(); 

        System.out.printf("Cidade Pesquisada:%n%n");
// exibe os nomes de coluna no ResultSet
        for (int i = 1; i <= numberOfColumns; i++)
            System.out.printf("%-8s\t", metaData.getColumnName(i));
        System.out.println();
// exibe os resultados da consulta
        while (resultSet.next())
        {
            for (int i = 1; i <= numberOfColumns; i++)
                System.out.printf("%-8s\t", resultSet.getObject(i));
            System.out.println();
        }
       } // Os métodos close dos objetos AutoCloseable são chamados agoraÿ
        catch (SQLException sqlException)
        {
        sqlException.printStackTrace();
        }
    }
} // fim da classe TesteBD


 