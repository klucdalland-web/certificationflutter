import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookingScreen extends StatefulWidget {
  final String destinationName;

  const BookingScreen({super.key, required this.destinationName});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  double _numGuests = 1;
  DateTime? _selectedDate;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a travel date')),
        );
        return;
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Booking Confirmed!'),
          content: Text(
            'Thank you, ${_nameController.text}! Your trip to ${widget.destinationName} on ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year} for ${_numGuests.toInt()} guest(s) is confirmed.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.goNamed('home');
              },
              child: const Text('Great!'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 7)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Your Trip'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Destination: ${widget.destinationName}',
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              
              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter your name';
                  if (value.length < 3) return 'Name must be at least 3 characters';
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Email Field
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter your email';
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // Guests Slider
              Text(
                'Number of Guests: ${_numGuests.toInt()}',
                style: theme.textTheme.titleMedium,
              ),
              Slider(
                value: _numGuests,
                min: 1,
                max: 10,
                divisions: 9,
                label: _numGuests.round().toString(),
                onChanged: (value) => setState(() => _numGuests = value),
              ),
              const SizedBox(height: 20),

              // Date Picker
              ListTile(
                title: Text(
                  _selectedDate == null
                      ? 'Select Travel Date'
                      : 'Date: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                ),
                leading: const Icon(Icons.calendar_today),
                trailing: const Icon(Icons.arrow_drop_down),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                onTap: () => _selectDate(context),
              ),
              const SizedBox(height: 48),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text(
                    'Confirm Booking',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
