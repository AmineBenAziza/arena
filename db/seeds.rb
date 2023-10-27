# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Weapon.create([
    {
      name: 'Vandal',
      attack_points: 40
    },
    {
      name: 'Phantom',
      attack_points: 35
    },
    {
      name: 'Spectre',
      attack_points: 25
    },
    {
      name: 'Judge',
      attack_points: 20
    },
    {
      name: 'Stinger',
      attack_points: 18
    },
    {
      name: 'Pistol',
      attack_points: 15
    },
    {
      name: 'Grenade',
      attack_points: 10
    }
  ])

  Shield.create([
    {
      name: 'Full Shield',
      defense_points: 50
    },
    {
      name: 'Light Shild',
      defense_points: 25
    },
    {
      name: 'Flash',
      defense_points: 5
    },
    {
      name: 'Smoke',
      defense_points: 5
    }
  ])

  Fighter.create([
    {
      name: "Yuru",
      life_points: 100,
      attack_points: 20,
      experience_points: 1
    },
    {
      name: "Neon",
      life_points: 100,
      attack_points: 20,
      experience_points: 1
    },
    {
      name: "Reyna",
      life_points: 100,
      attack_points: 20,
      experience_points: 1
    },
    {
      name: "Raze",
      life_points: 100,
      attack_points: 20,
      experience_points: 1
    },
    {
      name: "Jett",
      life_points: 100,
      attack_points: 20,
      experience_points: 1
    },
    {
      name: "Phonix",
      life_points: 100,
      attack_points: 20,
      experience_points: 1
    },
    {
      name: "Brimstone",
      life_points: 100,
      attack_points: 20,
      experience_points: 1
    }
  ])