# Manim-playground
This project is used as my personal playground to get started with Manim.

## Environment setup (NixOS)
Following chapter includes instructions on how to run this
Project on Linux, specifically NixOS.

1. cd in to project directory (`cd <path>`)
2. run `nix-shell` in order to load the environment.
3. A *venv* will be automatically created. Packages path will automatically linked into the venv
4. Start development :)

## Render Manim scence
Mainm Scenes can be renderd in test quality by the following command:
`manim -pql <PATH TO PYTHON FILE> <NAME OF SCENE>`