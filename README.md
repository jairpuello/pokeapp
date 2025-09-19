
# Ejemplo Flutter con Provider

Este repositorio contiene un proyecto de ejemplo en Flutter que utiliza el paquete [Provider](https://pub.dev/packages/provider) para la gestión de estado. El objetivo es mostrar cómo estructurar una aplicación Flutter moderna usando Provider para manejar datos y actualizar la interfaz de usuario de forma reactiva.

## Características principales

- Uso de Provider y ChangeNotifier para la gestión de estado.
- Ejemplo de consumo de datos (Pokémon) y actualización de la UI.
- Arquitectura recomendada para proyectos Flutter escalables.

## Estructura del proyecto

- `lib/main.dart`: Punto de entrada de la app, configuración de Provider.
- `lib/providers/`: Proveedores de estado (ejemplo: `PokemonProvider`).
- `lib/pages/`: Páginas principales de la app (ejemplo: `PokemonPage`).
- `lib/models/` y `lib/services/`: Modelos y servicios para manejo de datos.

## ¿Cómo ejecutar este proyecto?

1. Clona el repositorio:
	```sh
	git clone https://github.com/jairpuello/pokeapp.git
	```
2. Instala dependencias:
	```sh
	flutter pub get
	```
3. Ejecuta la app:
	```sh
	flutter run
	```

## Perfil del repositorio

**Nombre:** test_flutter

**Descripción:** Ejemplo de aplicación Flutter que utiliza Provider para la gestión de estado. Ideal para aprender buenas prácticas y arquitectura recomendada en Flutter.

**Tecnologías:**
- Flutter
- Provider

**Autor:** [Tu Nombre o Usuario]

**Licencia:** MIT

---
Este proyecto es ideal para quienes buscan un ejemplo claro y funcional de cómo implementar Provider en Flutter. ¡Siéntete libre de usarlo como base para tus propios proyectos!
