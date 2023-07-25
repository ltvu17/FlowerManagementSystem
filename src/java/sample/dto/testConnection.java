/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dto;

import java.util.ArrayList;
import sample.dao.AccountDAO;
import sample.dao.CategoryDAO;
import sample.dao.OrderDAO;
import sample.dao.PlanDAO;

/**
 *
 * @author LENOVO
 */
public class testConnection {
    public static void main(String[] args){
//        ArrayList<Account> account = AccountDAO.getAccount();
//        for(Account t : account){
//            System.out.println(t.getAccID() + "," + t.getEmail() + "," + t.getFullname() +"," + t.getPassword() +","+t.getPhone());
//        }
//        
//        Account acc = AccountDAO.getAccount("test@gmail.com","test");
//        if(acc!= null){
//           
//            if(acc.getRole()==1){
//                System.out.println("i am an ad min");
//            }
//            else{
//                System.out.println("I am a user");
//            }
//        }else System.out.println("fail");       
//        ArrayList<Order> list = OrderDAO.getOrders();
//        for(Order order : list){
//            System.out.println(order.getOrderDate());
//        }
//        acc = AccountDAO.getAccountByID(1);
//        System.out.println(acc.getFullname());
//        boolean result = PlanDAO.insertPlant("haha", 100, "huhu", "hoho", 1, 3);
//        System.out.println(result);
         ArrayList<Category> list = CategoryDAO.getCates();
         for(Category cate :list){
             System.out.println(cate.getCateID());
             System.out.println(cate.getCateName());
         }
//        if(AccountDAO.updateAccountSatus("test@gmail.com", 0)){
//            System.out.println("update successfully");
//        }else System.out.println("Error");
    }
    
    
}
