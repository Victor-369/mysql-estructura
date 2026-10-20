# mysql-estructura

MySQL database design exercises.

Each exercise lives in its own folder, with a UML diagram (PlantUML source and PNG image) and its own README. Level 1 exercises also include the SQL schema, sample data and example queries.

## Exercises

### Level 1

| Exercise | Description | Contents |
| --- | --- | --- |
| [Cul d'Ampolla Opticians](nivell1/exercici1/README.md) | Customers, suppliers, brands, glasses, employees and sales for an opticians. | UML diagram, `schema.sql`, `data.sql` |
| [Pizzeria](nivell1/exercici2/README.md) | Online food ordering for a pizzeria chain: customers, shops, employees, products and orders. | UML diagram, `schema.sql`, `data.sql` |

### Level 2

| Exercise | Description | Contents |
| --- | --- | --- |
| [Small YouTube](nivell2/exercici1/README.md) | A reduced version of YouTube: users, videos, tags, channels, subscriptions, playlists, comments and reactions. | UML diagram |

## Repository structure

```text
mysql-estructura/
├── nivell1/
│   ├── exercici1/   # Cul d'Ampolla Opticians
│   └── exercici2/   # Pizzeria
└── nivell2/
    └── exercici1/   # Small YouTube
```

## Requirements

- MySQL 8.0.16 or later, with InnoDB and `utf8mb4` support (needed for the enforced `CHECK` constraints in the Pizzeria exercise).
- Optionally, [PlantUML](https://plantuml.com/) to edit and regenerate the diagrams from the `.puml` files.

See each exercise's README for set-up instructions and the example queries it includes.

## License

This project is licensed under the [MIT License](LICENSE).
