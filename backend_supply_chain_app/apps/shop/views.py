from django.shortcuts import render

# Create your views here.
from rest_framework import generics, status
from rest_framework.response import Response
from rest_framework.views import APIView
from .models import Product, Cart, CartItem
from .serializers import ProductSerializer, CartSerializer

class ProductListView(generics.ListAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer


class CartView(APIView):
    def get(self, request, format=None):
        cart_id = request.session.get('cart_id')
        if cart_id:
            cart = Cart.objects.get(id=cart_id)
        else:
            cart = Cart.objects.create()
            request.session['cart_id'] = cart.id
        serializer = CartSerializer(cart)
        return Response(serializer.data)

class AddToCartView(APIView):
    def post(self, request, format=None):
        cart_id = request.session.get('cart_id')
        if not cart_id:
            cart = Cart.objects.create()
            request.session['cart_id'] = cart.id
        else:
            cart = Cart.objects.get(id=cart_id)
        product_id = request.data.get('product_id')
        quantity = int(request.data.get('quantity', 1))
        product = Product.objects.get(id=product_id)
        cart_item, created = CartItem.objects.get_or_create(cart=cart, product=product)
        if not created:
            cart_item.quantity += quantity
        else:
            cart_item.quantity = quantity
        cart_item.save()
        return Response({'message': 'Added to cart'}, status=status.HTTP_200_OK)

class RemoveFromCartView(APIView):
    def post(self, request, format=None):
        cart_id = request.session.get('cart_id')
        product_id = request.data.get('product_id')
        if cart_id and product_id:
            cart = Cart.objects.get(id=cart_id)
            product = Product.objects.get(id=product_id)
            CartItem.objects.filter(cart=cart, product=product).delete()
            return Response({'message': 'Removed from cart'}, status=status.HTTP_200_OK)
        return Response({'error': 'Invalid request'}, status=status.HTTP_400_BAD_REQUEST)
