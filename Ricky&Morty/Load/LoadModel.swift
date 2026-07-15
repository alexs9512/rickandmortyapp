//
//  LoadModel.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 03/07/26.
//

struct LoadModel {
  
  let phrases = [
    "Rick Sánchez: \"Cuando te das cuenta de que nada importa, el universo es tuyo.\"",
    "Morty Smith: \"Los padres son simplemente niños teniendo más niños.\"",
    "Rick Sánchez: \"La mente adolescente es su propio peor enemigo.\"",
    "Beth Smith: \"Cuando dos personas crean una vida juntas, dejan de lado sus vidas previas como individuos.\"",
    "Rick Sánchez: \"Todos los hospitales tienen un médico que dicen que es el mejor médico de toda la galaxia.\"",
    "Zeep Xanflorp: \"Deserté de la escuela, no es un lugar para la gente inteligente.\"",
    "Sr. Meeseeks: \"¿Sabes qué es lo mejor que puedes hacer para la gente que depende de ti? Sé honesto con ellos, incluso significa liberarlos.\"",
    "Morty Smith: \"¿Tienes a un planeta completo generando electricidad para ti? ¡Eso es esclavitud!\"",
    "Beth Smith: \"Me estoy quedando sin excusas para no ser quien soy, ¿así que quién soy?\"",
    "Rick Sánchez: \"La vida está hecha de pequeñas concesiones.\""
  ]
  
  func RamdomPhrase() -> String {
    return phrases.randomElement() ?? "Cargando... Bup!"
  }
}
