package com.service.impl;

import com.dao.UserDao;
import com.dao.impl.UserDaoImpl;
import com.domain.Book;
import com.domain.User;
import com.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDao dao=new UserDaoImpl();
    @Override
    public void addUser(User user) {
        dao.addUser(user);
    }

    @Override
    public User findUser(User user) {
       return dao.findUser(user);
    }

    @Override
    public List<Book> findBooks() {
        return dao.findBooks();
    }

    @Override
    public void addBook(Book book) {
        dao.addBook(book);
    }

    @Override
    public void deleteBook(int id) {
        dao.deleteBook(id);
    }

    @Override
    public List<Book> findBookByName(String name) {
        return dao.findBookByName(name);
    }

    @Override
    public Book findBookById(String id) {
        return dao.findBookById(id);
    }

    @Override
    public void updateBookById(Book book) {
        dao.updateBookById(book);
    }

    @Override
    public String findUserByName(String name) {
       return  dao.findUserByName(name);
    }


}
