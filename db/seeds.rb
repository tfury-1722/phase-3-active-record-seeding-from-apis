# Add seed data in this file
puts "Seeding spells..."
    # An array of spells we want to insert into the database
spells = ['acid-arrow', 'animal-messenger', 'calm-emotions', 'charm-person']
    # Send each spell to the GET request through interpolating inside the URL
spells.each do |spells|
    # Storing the response object from the API inside of a local variable
    response = RestClient.get "https://www.dnd5eapi.co/api/spells/#{spells}"
    # Convert response object to ruby hash/object by JSON parsing method
    spell_hash = JSON.parse response
    # Use data from hash to create & save a new record/table_row
    Spell.create(
        name: spell_hash['name'],
        level: spell_hash['level'],
        description: spell_hash['desc'][0]
    )
end

puts "Done seeding!"