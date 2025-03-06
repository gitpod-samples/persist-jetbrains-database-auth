CREATE TABLE products (
                          id SERIAL PRIMARY KEY,
                          name TEXT NOT NULL,
                          details JSONB
);


INSERT INTO products (name, details) VALUES
                                         ('Laptop', '{
    "brand": "Dell",
    "model": "XPS 15",
    "specs": {
        "processor": "Intel Core i7-12700H",
        "ram": "32GB DDR5",
        "storage": {
            "type": "SSD",
            "capacity": "1TB"
        },
        "display": {
            "size": "15.6 inch",
            "resolution": "3840x2160",
            "type": "OLED"
        },
        "graphics": {
            "brand": "NVIDIA",
            "model": "RTX 3060",
            "memory": "6GB GDDR6"
        },
        "battery": "86Wh",
        "ports": ["USB-C", "Thunderbolt 4", "HDMI", "SD Card Reader"]
    },
    "features": {
        "fingerprintScanner": true,
        "backlitKeyboard": true,
        "webcam": {
            "resolution": "1080p",
            "IR_sensor": true
        }
    },
    "price": {
        "currency": "USD",
        "amount": 1999.99
    },
    "warranty": {
        "duration": "2 years",
        "coverage": ["hardware", "battery", "software support"]
    }
}'),

                                         ('Smartphone', '{
    "brand": "Samsung",
    "model": "Galaxy S24 Ultra",
    "specs": {
        "processor": "Snapdragon 8 Gen 3",
        "ram": "12GB",
        "storage": {
            "type": "UFS 4.0",
            "capacity": "512GB"
        },
        "display": {
            "size": "6.8 inch",
            "resolution": "3088x1440",
            "refreshRate": "120Hz",
            "panel": "AMOLED"
        },
        "camera": {
            "rear": {
                "main": "200MP",
                "ultrawide": "12MP",
                "telephoto": ["10MP (3x zoom)", "10MP (10x zoom)"]
            },
            "front": "12MP"
        },
        "battery": "5000mAh",
        "ports": ["USB-C"],
        "wirelessCharging": true
    },
    "features": {
        "stylusSupport": true,
        "waterResistance": "IP68",
        "fingerprintSensor": "Under-display Ultrasonic"
    },
    "price": {
        "currency": "USD",
        "amount": 1399.99
    },
    "warranty": {
        "duration": "1 year",
        "coverage": ["hardware", "battery"]
    }
}'),

                                         ('Tablet', '{
    "brand": "Apple",
    "model": "iPad Pro 12.9",
    "specs": {
        "processor": "Apple M2",
        "ram": "16GB",
        "storage": {
            "type": "NVMe",
            "capacity": "1TB"
        },
        "display": {
            "size": "12.9 inch",
            "resolution": "2732x2048",
            "panel": "Liquid Retina XDR",
            "refreshRate": "120Hz"
        },
        "camera": {
            "rear": "12MP + 10MP Ultra-Wide",
            "front": "12MP Ultra-Wide"
        },
        "battery": "40.88Wh",
        "ports": ["USB-C (Thunderbolt 4)"],
        "wirelessCharging": false
    },
    "features": {
        "faceID": true,
        "stylusSupport": "Apple Pencil 2",
        "proMotionTechnology": true
    },
    "price": {
        "currency": "USD",
        "amount": 1899.99
    },
    "warranty": {
        "duration": "1 year",
        "coverage": ["hardware", "software support"]
    }
}');