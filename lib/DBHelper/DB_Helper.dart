
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    print('**************  10th  ****************');
    await database.execute("""CREATE TABLE SSC(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        gujaratiF INTEGER,
        maths INTEGER,
        socialscience INTEGER,
        science INTEGER,
        english INTEGER,
        gujaratiS INTEGER,
        hindi INTEGER
      )
      """);
    print('**************  12th Science  ****************');
    await database.execute("""CREATE TABLE Science(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        physice INTEGER,
        chemistry INTEGER,
        biology INTEGER,
        maths INTEGER,
        english INTEGER,
        gujarati INTEGER,
        computer INTEGER
      )
      """);
    print('**************  12th Commarce  ****************');
    await database.execute("""CREATE TABLE Commarce(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        account INTEGER,
        sp INTEGER,
        eco INTEGER,
        state INTEGER,
        BA INTEGER,
        gujaratiS INTEGER,
        gujaratiF INTEGER,
        hindi INTEGER,
        computer INTEGER
      )
      """);
    print('**************  12th Arts  ****************');
    await database.execute("""CREATE TABLE Arts(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        english INTEGER,
        gujarati INTEGER,
        eco INTEGER,
        sanskrit INTEGER,
        philosophy INTEGER,
        psychology INTEGER,
        sp INTEGER
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'kindacode.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
       // await Favoritetable(database);
      },
    );
  }

  // Create new item for 10th class(journal)
  static Future<int> createItem(int gujaratiF,int maths,int socialscience,int science, int english,int gujaratiS,int hindi) async {
    final db = await SQLHelper.db();
    final data = {'gujaratiF': gujaratiF,'maths' : maths,'socialscience' : socialscience ,'science' : science,'english': english,'gujaratiS' : gujaratiS,'hindi' : hindi,};
    final id = await db.insert('SSC', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }
  // Create new item for 12th Science(journal)
  static Future<int> createItemScience(int physics,int chemistry,int biology,int maths, int english,int gujarati,int computer) async {
    final db = await SQLHelper.db();
    final data = {'physice': physics,'chemistry' : chemistry,'biology' : biology ,'maths' : maths,'english': english,'gujarati' : gujarati,'computer' : computer,};
    final id = await db.insert('Science', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }
  // Create new item for 12th Commarce(journal)
  static Future<int> createItemCommarce(int account,int sp,int eco,int state, int BA,int gujaratiS,int gujaratiF,int hindi,int computer) async {
    final db = await SQLHelper.db();
    final data = {'account': account,'sp' : sp,'eco' : eco ,'state' : state,'BA': BA,'gujaratiS' : gujaratiS,'gujaratiF' : gujaratiF,'hindi' : hindi,'computer' : computer,};
    final id = await db.insert('Commarce', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }
  // Create new item for 12th Arts(journal)
  static Future<int> createItemArts(int english,int gujarati,int eco,int sanskrit, int philosophy,int psychology,int sp) async {
    final db = await SQLHelper.db();
    final data = {'english': english,'gujarati' : gujarati,'eco' : eco ,'sanskrit' : sanskrit,'philosophy': philosophy,'psychology' : psychology,'sp' : sp,};
    final id = await db.insert('Arts', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }
  // Read all marks from 10th class(journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('SSC', orderBy: "id");
  }

  // Read all marks from 12th Science(journals)
  static Future<List<Map<String, dynamic>>> getItemsScience() async {
    final db = await SQLHelper.db();
    return db.query('Science', orderBy: "id");
  }

  // Read all marks from 12th Commarce(journals)
  static Future<List<Map<String, dynamic>>> getItemsCommarce() async {
    final db = await SQLHelper.db();
    return db.query('Commarce', orderBy: "id");
  }

  // Read all marks from 12th Arts(journals)
  static Future<List<Map<String, dynamic>>> getItemsArts() async {
    final db = await SQLHelper.db();
    return db.query('Arts', orderBy: "id");
  }

  //update marks for 10th result
  static Future<int> updateItem(
      int id,int gujaratiF,int maths,int socialscience,int science, int english,int gujaratiS,int hindi) async {
    final db = await SQLHelper.db();

    final data = {
      'gujaratiF': gujaratiF,
      'maths': maths,
      'socialscience' : socialscience,
      'science' : science,
      'english' : english,
      'gujaratiS' : gujaratiS,
      'hindi' : hindi
    };

    final result =
    await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Read a single item by id 10th
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('SSC', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Read a single item by id 12th Science
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItemScience(int id) async {
    final db = await SQLHelper.db();
    return db.query('Science', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Read a single item by id 12th Commarce
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItemCommarce(int id) async {
    final db = await SQLHelper.db();
    return db.query('Commarce', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Read a single item by id 12th Arts
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItemArts(int id) async {
    final db = await SQLHelper.db();
    return db.query('Arts', where: "id = ?", whereArgs: [id], limit: 1);
  }

}