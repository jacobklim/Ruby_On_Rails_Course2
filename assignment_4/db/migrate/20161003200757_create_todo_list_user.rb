class CreateTodoListUser < ActiveRecord::Migration
  def change
    #create_table :todo_list_users do |t|
      add_reference :todo_lists, :user, index: true, foreign_key:true
    #end
  end
end
