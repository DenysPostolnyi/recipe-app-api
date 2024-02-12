"""
Tests for models
"""
from django.contrib.auth import get_user_model
from django.test import TestCase


class ModelTests(TestCase):
    """Tests for models"""

    def test_create_user_with_email_successful(self):
        """Test creating a user with email successful"""
        email = "test@example.com"
        password = "testpassword123"
        user = get_user_model().objects.create(email=email, password=password)

        self.assertEqual(user.email, email)
        self.assertTrue(user.check_password(password))
