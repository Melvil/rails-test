# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120904061707) do

  create_table "abilities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "abilities", ["name"], :name => "index_abilities_on_name", :unique => true

  create_table "vacancies", :force => true do |t|
    t.string   "title"
    t.datetime "date_create"
    t.datetime "date_end"
    t.integer  "duration"
    t.integer  "salary"
    t.text     "contacts"
    t.integer  "abilities_count", :default => 0, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "vacancies", ["abilities_count"], :name => "index_vacancies_on_abilities_count"
  add_index "vacancies", ["date_create"], :name => "index_vacancies_on_date_create"
  add_index "vacancies", ["date_end"], :name => "index_vacancies_on_date_end"
  add_index "vacancies", ["salary"], :name => "index_vacancies_on_salary"

  create_table "vacancy_abilities", :force => true do |t|
    t.integer  "vacancy_id"
    t.integer  "ability_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "vacancy_abilities", ["vacancy_id", "ability_id"], :name => "index_vacancy_abilities_on_vacancy_id_and_ability_id", :unique => true

  create_table "worker_abilities", :force => true do |t|
    t.integer  "worker_id"
    t.integer  "ability_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "worker_abilities", ["worker_id", "ability_id"], :name => "index_worker_abilities_on_worker_id_and_ability_id", :unique => true

  create_table "workers", :force => true do |t|
    t.string   "name"
    t.text     "contacts"
    t.boolean  "search_status",   :default => false, :null => false
    t.integer  "desired_salary"
    t.integer  "abilities_count", :default => 0,     :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "workers", ["abilities_count"], :name => "index_workers_on_abilities_count"
  add_index "workers", ["desired_salary"], :name => "index_workers_on_desired_salary"
  add_index "workers", ["name"], :name => "index_workers_on_name"
  add_index "workers", ["search_status"], :name => "index_workers_on_search_status"

end
