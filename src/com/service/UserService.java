package com.service;

import com.domain.Book;
import com.domain.User;

import java.util.List;

public interface UserService {
    void addUser(User user);

    User findUser(User user);

    List<Book> findBooks();

    void addBook(Book book);

    void deleteBook(int id);

    List<Book> findBookByName(String name);

    Book findBookById(String id);

    void updateBookById(Book book);

    String findUserByName(String name);
}
