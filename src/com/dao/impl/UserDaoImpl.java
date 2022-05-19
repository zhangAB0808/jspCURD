package com.dao.impl;

import com.dao.UserDao;
import com.domain.Book;
import com.domain.User;
import com.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public void addUser(User user) {
        String sql="insert into user values(?,?)";
      template.update(sql,user.getName(),user.getPassword());
    }

    @Override
    public User findUser(User user) {
        try {
            String sql = "select * from user where name=? and password=?";
            return template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), user.getName(), user.getPassword());
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Book> findBooks() {
        try {
            String sql = "select * from book";
            return template.query(sql, new BeanPropertyRowMapper<>(Book.class));
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void addBook(Book book) {
        String sql = "insert into book values(null,?,?,?)";
        template.update(sql,book.getType(),book.getName(),book.getPrice());
    }

    @Override
    public void deleteBook(int id) {
        String sql = "delete from book where id=?";
        template.update(sql, id);
    }

    @Override
    public List<Book> findBookByName(String name) {
        try {
            String sql = "select * from book where name like '%"+name+"%'";
            return template.query(sql, new BeanPropertyRowMapper<>(Book.class));
        }catch(Exception e){
            e.printStackTrace();
            return  new ArrayList<Book>();
        }
    }

    @Override
    public Book findBookById(String id) {
        String sql = "select * from book where id=?";
        return  template.queryForObject(sql,new BeanPropertyRowMapper<>(Book.class),id);
    }

    @Override
    public void updateBookById(Book book) {
        String sql = "update book set type=?,name=?,price=? where id=?";
        template.update(sql,book.getType(),book.getName(),book.getPrice(),book.getId());
    }

    @Override
    public String findUserByName(String name) {
        try{
        String sql = "select * from user where name=?";
        User user = template.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), name);
        return user.getName();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }


}
