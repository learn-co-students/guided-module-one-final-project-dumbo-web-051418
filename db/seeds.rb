require 'csv'

#def import_pokemon
  csv_text = File.read("./pokemon_project_seeds.csv")
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    new_pokemon = Pokemon.new(
      name: row[1],
      description: row[2],
      height: row[3],
      weight: row[4],
      type_1: row[5],
      type_2: row[6],
      weakness_1: row[7],
      weakness_2: row[8],
      catch_rate: row[9],
      base_hp: row[10],
      base_attack: row[11],
      base_defense: row[12],
      base_sp_attack: row[13],
      base_sp_defense: row[14],
      base_speed: row[15],
      base_experience: row[16]
      )
      new_pokemon.save
  end
#end

gary = Trainer.create(name: "Gary", hometown: "Pallet Town")
pidgeot = Pokemon.find_by(name: "Pidgeot")
Pokeball.create(trainer_id: gary.id, pokemon_id: pidgeot.id)
alakazam = Pokemon.find_by(name: "Alakazam")
Pokeball.create(trainer_id: gary.id, pokemon_id: alakazam.id)
rhydon = Pokemon.find_by(name: "Rhydon")
Pokeball.create(trainer_id: gary.id, pokemon_id: rhydon.id)
exeggutor = Pokemon.find_by(name: "Exeggutor")
Pokeball.create(trainer_id: gary.id, pokemon_id: exeggutor.id)
gyarados = Pokemon.find_by(name: "Gyarados")
Pokeball.create(trainer_id: gary.id, pokemon_id: gyarados.id)
charizard = Pokemon.find_by(name: "Charizard")
Pokeball.create(trainer_id: gary.id, pokemon_id: charizard.id)

brock = Trainer.create(name: "Brock", hometown: "")
geodude = Pokemon.find_by(name: "Geodude")
Pokeball.create(trainer_id: brock.id, pokemon_id: geodude.id)
onix = Pokemon.find_by(name: "Onix")
Pokeball.create(trainer_id: brock.id, pokemon_id: onix.id)

misty = Trainer.create(name: "Misty", hometown: "")
staryu = Pokemon.find_by(name: "Staryu")
Pokeball.create(trainer_id: misty.id, pokemon_id: staryu.id)
misty = Trainer.find(3)
starmie = Pokemon.find_by(name: "Starmie")
Pokeball.create(trainer_id: misty.id, pokemon_id: starmie.id)

giovanni = Trainer.create(name: "Giovanni", hometown: "")
onix = Pokemon.find_by(name: "Onix")
Pokeball.create(trainer_id: giovanni.id, pokemon_id: onix.id)
rhydon = Pokemon.find_by(name: "Rhydon")
Pokeball.create(trainer_id: giovanni.id, pokemon_id: rhydon.id)
kangaskhan = Pokemon.find_by(name: "Kangaskhan")
Pokeball.create(trainer_id: giovanni.id, pokemon_id: kangaskhan.id)

bruno = Trainer.create(name: "Bruno", hometown: "")
onix = Pokemon.find_by(name: "Onix")
Pokeball.create(trainer_id: bruno.id, pokemon_id: onix.id)
hitmonchan = Pokemon.find_by(name: "Hitmonchan")
Pokeball.create(trainer_id: bruno.id, pokemon_id: hitmonchan.id)
hitmonlee = Pokemon.find_by(name: "Hitmonlee")
Pokeball.create(trainer_id: bruno.id, pokemon_id: hitmonlee.id)
machamp = Pokemon.find_by(name: "Machamp")
Pokeball.create(trainer_id: bruno.id, pokemon_id: machamp.id)

sabrina = Trainer.create(name: "Sabrina", hometown: "")
kadabra = Pokemon.find_by(name: "Kadabra")
Pokeball.create(trainer_id: sabrina.id, pokemon_id: kadabra.id)
mime = Pokemon.find_by(name: "Mr. Mime")
Pokeball.create(trainer_id: sabrina.id, pokemon_id: mime.id)
venomoth = Pokemon.find_by(name: "Venomoth")
Pokeball.create(trainer_id: sabrina.id, pokemon_id: venomoth.id)
alakazam = Pokemon.find_by(name: "Alakazam")
Pokeball.create(trainer_id: sabrina.id, pokemon_id: alakazam.id)
