class AddUniqueConstraintToCountdowns < ActiveRecord::Migration[5.1]
  def change
    def up
        execute <<-SQL
          alter table countdowns
            add constraint only_one_countdown unique purchased_game_id;
        SQL
      end

      def down
        execute <<-SQL
          alter table countdowns
            drop constraint if exists only_one_countdown;
        SQL
      end
  end
end
