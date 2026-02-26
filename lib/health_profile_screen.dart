// lib/health_profile_screen.dart
import 'package:flutter/material.dart';

class HealthProfileScreen extends StatefulWidget {
  const HealthProfileScreen({super.key});

  @override
  State<HealthProfileScreen> createState() => _HealthProfileScreenState();
}

class _HealthProfileScreenState extends State<HealthProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  // Respiratory Health
  bool hasAsthma = false;
  String asthmaSeverity = 'Mild';
  bool hasCOPD = false;
  bool hasBronchitis = false;
  bool hasAllergies = false;
  String allergyTypes = '';
  bool hasPneumoniaHistory = false;
  bool hasSleepApnea = false;
  int age = 25;

  // Smoking & Exposure
  String smokingStatus = 'Non-smoker';
  int cigarettesPerDay = 0;
  int yearsQuit = 0;
  bool usesVape = false;
  bool passiveSmoking = false;
  bool occupationalExposure = false;
  String occupationType = '';

  // Physical Activity
  bool outdoorWalking = false;
  int walkingMinutes = 0;
  bool cycling = false;
  int cyclingMinutes = 0;
  bool running = false;
  int runningMinutes = 0;
  bool outdoorSports = false;
  String sportsType = '';

  bool gymWorkout = false;
  int gymMinutes = 0;
  bool yogaBreathing = false;
  int yogaMinutes = 0;
  bool swimming = false;
  int swimmingMinutes = 0;

  // Indoor Environment
  bool hasAirPurifier = false;
  int purifierHours = 0;
  int indoorPlants = 0;
  String cookingMethod = 'Electric/Induction';
  String ventilationQuality = 'Good';
  bool usesIncense = false;
  int incenseFrequency = 0;

  // Commute
  String commuteMode = 'Personal Vehicle';
  int commuteMinutes = 0;
  String trafficDensity = 'Moderate';

  // Diet & Lifestyle
  double waterIntake = 2.0;
  String dietQuality = 'Balanced';
  bool drinksGreenTea = false;
  int sleepHours = 7;
  String stressLevel = 'Medium';
  String maskUsage = 'None';
  bool opensWindows = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a1a2e),
      appBar: AppBar(
        backgroundColor: const Color(0xFF16213e),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Health Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildSectionHeader('🫁 Respiratory Health', Icons.medical_services),
            _buildCard([
              _buildSwitchTile('Asthma', hasAsthma, (val) => setState(() => hasAsthma = val)),
              if (hasAsthma) _buildDropdown('Severity', asthmaSeverity, ['Mild', 'Moderate', 'Severe'], (val) => setState(() => asthmaSeverity = val!)),
              _buildSwitchTile('COPD', hasCOPD, (val) => setState(() => hasCOPD = val)),
              _buildSwitchTile('Bronchitis', hasBronchitis, (val) => setState(() => hasBronchitis = val)),
              _buildSwitchTile('Allergies', hasAllergies, (val) => setState(() => hasAllergies = val)),
              if (hasAllergies) _buildTextField('Allergy Types (e.g., dust, pollen)', allergyTypes, (val) => allergyTypes = val),
              _buildSwitchTile('Previous Pneumonia', hasPneumoniaHistory, (val) => setState(() => hasPneumoniaHistory = val)),
              _buildSwitchTile('Sleep Apnea', hasSleepApnea, (val) => setState(() => hasSleepApnea = val)),
              _buildSlider('Age', age.toDouble(), 1, 100, (val) => setState(() => age = val.toInt()), suffix: ' years'),
            ]),

            const SizedBox(height: 24),
            _buildSectionHeader('🚬 Smoking & Exposure', Icons.smoking_rooms),
            _buildCard([
              _buildDropdown('Smoking Status', smokingStatus, ['Non-smoker', 'Current Smoker', 'Ex-smoker', 'Vaper'], (val) => setState(() => smokingStatus = val!)),
              if (smokingStatus == 'Current Smoker') _buildSlider('Cigarettes per Day', cigarettesPerDay.toDouble(), 0, 40, (val) => setState(() => cigarettesPerDay = val.toInt()), suffix: ' cigs'),
              if (smokingStatus == 'Ex-smoker') _buildSlider('Years Since Quit', yearsQuit.toDouble(), 0, 50, (val) => setState(() => yearsQuit = val.toInt()), suffix: ' years'),
              _buildSwitchTile('Vaping/E-cigarettes', usesVape, (val) => setState(() => usesVape = val)),
              _buildSwitchTile('Passive Smoking Exposure', passiveSmoking, (val) => setState(() => passiveSmoking = val)),
              _buildSwitchTile('Occupational Exposure', occupationalExposure, (val) => setState(() => occupationalExposure = val)),
              if (occupationalExposure) _buildTextField('Occupation Type', occupationType, (val) => occupationType = val),
            ]),

            const SizedBox(height: 24),
            _buildSectionHeader('🏃 Outdoor Physical Activity', Icons.directions_run),
            _buildCard([
              _buildSwitchTile('Walking/Jogging', outdoorWalking, (val) => setState(() => outdoorWalking = val)),
              if (outdoorWalking) _buildSlider('Minutes per Day', walkingMinutes.toDouble(), 0, 180, (val) => setState(() => walkingMinutes = val.toInt()), suffix: ' min'),
              _buildSwitchTile('Cycling', cycling, (val) => setState(() => cycling = val)),
              if (cycling) _buildSlider('Minutes per Day', cyclingMinutes.toDouble(), 0, 180, (val) => setState(() => cyclingMinutes = val.toInt()), suffix: ' min'),
              _buildSwitchTile('Running', running, (val) => setState(() => running = val)),
              if (running) _buildSlider('Minutes per Day', runningMinutes.toDouble(), 0, 180, (val) => setState(() => runningMinutes = val.toInt()), suffix: ' min'),
              _buildSwitchTile('Outdoor Sports', outdoorSports, (val) => setState(() => outdoorSports = val)),
              if (outdoorSports) _buildTextField('Sport Type', sportsType, (val) => sportsType = val),
            ]),

            const SizedBox(height: 24),
            _buildSectionHeader('💪 Indoor Exercise', Icons.fitness_center),
            _buildCard([
              _buildSwitchTile('Gym/Indoor Workout', gymWorkout, (val) => setState(() => gymWorkout = val)),
              if (gymWorkout) _buildSlider('Minutes per Day', gymMinutes.toDouble(), 0, 180, (val) => setState(() => gymMinutes = val.toInt()), suffix: ' min'),
              _buildSwitchTile('Yoga/Breathing Exercises', yogaBreathing, (val) => setState(() => yogaBreathing = val)),
              if (yogaBreathing) _buildSlider('Minutes per Day', yogaMinutes.toDouble(), 0, 180, (val) => setState(() => yogaMinutes = val.toInt()), suffix: ' min'),
              _buildSwitchTile('Swimming', swimming, (val) => setState(() => swimming = val)),
              if (swimming) _buildSlider('Minutes per Day', swimmingMinutes.toDouble(), 0, 180, (val) => setState(() => swimmingMinutes = val.toInt()), suffix: ' min'),
            ]),

            const SizedBox(height: 24),
            _buildSectionHeader('🏠 Indoor Environment', Icons.home),
            _buildCard([
              _buildSwitchTile('Air Purifier', hasAirPurifier, (val) => setState(() => hasAirPurifier = val)),
              if (hasAirPurifier) _buildSlider('Hours per Day', purifierHours.toDouble(), 0, 24, (val) => setState(() => purifierHours = val.toInt()), suffix: ' hrs'),
              _buildSlider('Indoor Plants', indoorPlants.toDouble(), 0, 20, (val) => setState(() => indoorPlants = val.toInt()), suffix: ' plants'),
              _buildDropdown('Cooking Method', cookingMethod, ['Electric/Induction', 'Gas Stove', 'Mixed'], (val) => setState(() => cookingMethod = val!)),
              _buildDropdown('Ventilation Quality', ventilationQuality, ['Good', 'Moderate', 'Poor'], (val) => setState(() => ventilationQuality = val!)),
              _buildSwitchTile('Uses Incense/Candles', usesIncense, (val) => setState(() => usesIncense = val)),
              if (usesIncense) _buildSlider('Times per Week', incenseFrequency.toDouble(), 0, 14, (val) => setState(() => incenseFrequency = val.toInt()), suffix: ' times'),
            ]),

            const SizedBox(height: 24),
            _buildSectionHeader('🚗 Daily Commute', Icons.commute),
            _buildCard([
              _buildDropdown('Commute Mode', commuteMode, ['Walking/Cycling', 'Public Transport', 'Personal Vehicle', 'Work From Home'], (val) => setState(() => commuteMode = val!)),
              if (commuteMode != 'Work From Home') _buildSlider('Commute Duration', commuteMinutes.toDouble(), 0, 180, (val) => setState(() => commuteMinutes = val.toInt()), suffix: ' min'),
              if (commuteMode != 'Work From Home') _buildDropdown('Traffic Density', trafficDensity, ['Light', 'Moderate', 'Heavy'], (val) => setState(() => trafficDensity = val!)),
            ]),

            const SizedBox(height: 24),
            _buildSectionHeader('🍎 Diet & Lifestyle', Icons.restaurant),
            _buildCard([
              _buildSlider('Water Intake', waterIntake, 0, 5, (val) => setState(() => waterIntake = val), divisions: 20, suffix: ' L/day'),
              _buildDropdown('Diet Quality', dietQuality, ['Processed Heavy', 'Balanced', 'Antioxidant Rich'], (val) => setState(() => dietQuality = val!)),
              _buildSwitchTile('Drinks Green Tea', drinksGreenTea, (val) => setState(() => drinksGreenTea = val)),
              _buildSlider('Sleep Hours', sleepHours.toDouble(), 3, 12, (val) => setState(() => sleepHours = val.toInt()), suffix: ' hrs'),
              _buildDropdown('Stress Level', stressLevel, ['Low', 'Medium', 'High'], (val) => setState(() => stressLevel = val!)),
              _buildDropdown('Mask Usage When Outside', maskUsage, ['None', 'Cloth', 'Surgical', 'N95'], (val) => setState(() => maskUsage = val!)),
              _buildSwitchTile('Opens Windows Frequently', opensWindows, (val) => setState(() => opensWindows = val)),
            ]),

            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _saveProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4CAF50),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Save Profile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 24),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0f3460),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(children: children),
    );
  }

  Widget _buildSwitchTile(String label, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF4CAF50),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, String value, List<String> items, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: value,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF1a1a2e),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            dropdownColor: const Color(0xFF1a1a2e),
            style: const TextStyle(color: Colors.white),
            items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        initialValue: initialValue,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: const Color(0xFF1a1a2e),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildSlider(String label, double value, double min, double max, Function(double) onChanged, {int? divisions, String suffix = ''}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14)),
              Text('${value.toStringAsFixed(divisions != null ? 1 : 0)}$suffix', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions ?? (max - min).toInt(),
            activeColor: const Color(0xFF4CAF50),
            inactiveColor: Colors.white24,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // TODO: Save to storage/database
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile saved successfully!'),
          backgroundColor: Color(0xFF4CAF50),
        ),
      );
      Navigator.pop(context);
    }
  }
}