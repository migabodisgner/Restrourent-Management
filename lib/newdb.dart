// Add a new method to store plate data
class DatabaseHelper {
  get database => null;

  // Existing code ...

  Future<void> createEventData(String phone, int totalPlates) async {
    final db = await database;
    await db.insert("events", {
      "phone": phone,
      "total_plates": totalPlates,
      "used_plates": 0, // Initial used plates
      "remaining_plates": totalPlates, // Remaining plates
    });
  }

  // Method to get event data (plates) for a user
  Future<Map<String, dynamic>?> getEventData(String phone) async {
    final db = await database;
    final result = await db.query(
      "events",
      where: "phone = ?",
      whereArgs: [phone],
    );
    return result.isNotEmpty ? result.first : null;
  }

  // Method to update event data (when plates are confirmed)
  Future<void> updateEventData(String phone, int usedPlates, int remainingPlates) async {
    final db = await database;
    await db.update(
      "events",
      {
        "used_plates": usedPlates,
        "remaining_plates": remainingPlates,
      },
      where: "phone = ?",
      whereArgs: [phone],
    );
  }
}
