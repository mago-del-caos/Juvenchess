CREATE TABLE IF NOT EXISTS Usuarios (
    id_usuario INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    password_hash TEXT,
    rol TEXT CHECK(rol IN ('admin', 'oficial', 'casual')) NOT NULL DEFAULT 'casual',
    puntuacion INTEGER NOT NULL DEFAULT 0,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Torneos (
    id_torneo INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    rango_min INTEGER NOT NULL DEFAULT 0,
    rango_max INTEGER NOT NULL DEFAULT 300,
    estado TEXT CHECK(estado IN ('abierto', 'en_curso', 'finalizado')) NOT NULL DEFAULT 'abierto',
    fecha_inicio DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Partidas_Historial (
    id_partida INTEGER PRIMARY KEY AUTOINCREMENT,
    id_blancas INTEGER NOT NULL,
    id_negras INTEGER NOT NULL,
    ganador TEXT CHECK(ganador IN ('w', 'b', 'draw')) NOT NULL,
    pgn TEXT NOT NULL,
    id_torneo INTEGER,
    fecha_partida DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Usuarios (username, password_hash, rol, puntuacion) 
VALUES ('Cifra_Admin', 'HASHTEMPORAL_CAMBIAR_EN_FASE2', 'admin', 9999);
