
# POKEAPP — Flutter + Provider + PokéAPI

Aplicación Flutter que muestra una galería de Pokémon en cuadrícula (3 por fila) y permite navegar a una vista de detalle con imagen, nombre, ID, altura, peso y tipos. La app consume la PokéAPI y gestiona el estado con Provider (ChangeNotifier), separando responsabilidades en modelos, servicios, providers y páginas.

## ✨ Características

- GridView responsivo con imágenes y nombres de Pokémon.
- Vista de detalle con información ampliada: ID, altura, peso y tipos.
- Consumo de API REST (PokéAPI) con `http`.
- Gestión de estado con `provider` y patrón `ChangeNotifier`.
- Navegación a detalle con `Navigator` y `MaterialPageRoute`.
- Arquitectura modular y escalable.

## 🧱 Arquitectura y flujo

- `models/`: Modelos de datos (`PokemonModels`, `PokemonDetails`).
- `services/`: Capa de acceso a datos (`PokemonServices`) que consume la PokéAPI.
- `providers/`: Estado de lista y de detalle (`PokemonProvider`, `PokemonDetailsProvider`).
- `pages/`: UI (grid `PokemonPage` y detalle `PokemonDetailPage`).

Flujo simplificado:
1) `PokemonProvider.fetchPokemons()` llama a `PokemonServices.fetchPokemons()` ➜ lista para la vista.
2) Al tocar un item, se navega a `PokemonDetailPage` con el `id` ➜ `PokemonDetailsProvider.fetchPokemonDetails(id)` consume `PokemonServices.fetchPokemonDetails(id)`.

## 🌐 Endpoints de PokéAPI usados

- Lista: `GET https://pokeapi.co/api/v2/pokemon` (usa `results[].name` y `results[].url`).
- Detalle: `GET https://pokeapi.co/api/v2/pokemon/{id}`.

Para imágenes de portada se construye la URL con el nombre:
`https://img.pokemondb.net/artwork/large/{name}.jpg`.

## 🗂️ Estructura del proyecto

- `lib/main.dart` → MultiProvider y `MaterialApp`.
- `lib/providers/pokemon_providers.dart` → providers de lista y detalle.
- `lib/services/pokemon_services.dart` → peticiones HTTP con `http`.
- `lib/models/pokemon_models.dart` → modelo de lista (extrae `id` desde la `url`).
- `lib/models/pokemon_details.dart` → modelo de detalle (mapa de `height`, `weight`, `types`, `sprites`).
- `lib/pages/pokemon_page.dart` → GridView (3 columnas) y navegación a detalle.
- `lib/pages/pokemon_detail_page.dart` → vista de detalle.

## 🛠️ Stack técnico

- Flutter 3.x
- provider ^6.x
- http ^1.x
- Material Design

## ▶️ Cómo ejecutar (Windows PowerShell)

```powershell
git clone https://github.com/jairpuello/pokeapp.git
cd pokeapp
flutter pub get
flutter run
```

> Requisitos: Flutter instalado y dispositivo/emulador en ejecución.

## 🧪 Notas de implementación

- El `id` del Pokémon se obtiene desde `results[i].url` dividiendo por `/` y tomando el penúltimo segmento.
- El grid usa `SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 3/4)`.
- En detalle, los textos usan tamaños mayores para legibilidad y los chips de tipo se centran con `Wrap`.

## 🐞 Troubleshooting

- `ProviderNotFoundException`: Asegúrate de registrar `PokemonProvider` y `PokemonDetailsProvider` en `MultiProvider` (en `main.dart`). Haz un Hot Restart.
- `The argument type 'MaterialColor'...`: Usa `backgroundColor: Colors.blue` (sin `Color(Colors.blue)`).
- Lista vacía: valida que `fetchPokemons()` parsea `results` y que el `id` se extrae desde la URL.
- Navegación: usa `Navigator.push(context, MaterialPageRoute(builder: (_) => PokemonDetailPage(pokemonId: id)))`.

## 🗺️ Roadmap

- Búsqueda y filtrado por nombre/tipo.
- Paginación / infinite scroll.
- Caché de imágenes y datos offline.
- Theming claro/oscuro.

## 👤 Autor

Jair Puello

## 📄 Licencia

MIT

---
Proyecto de referencia para aprender consumo de APIs, Provider y arquitectura limpia en Flutter.
