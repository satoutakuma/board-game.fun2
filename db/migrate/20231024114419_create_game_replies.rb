class CreateGameReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :game_replies do |t|

      t.timestamps
    end
  end
end
