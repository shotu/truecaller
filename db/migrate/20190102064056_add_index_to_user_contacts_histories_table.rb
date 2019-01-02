class AddIndexToUserContactsHistoriesTable < ActiveRecord::Migration[5.0]
  def change
    add_index(:user_contact_call_histories, %i[is_active  user_id start_time end_time ], name: 'call_histories_search_index')
  end
end
