from rest_framework.decorators import api_view
from rest_framework import status
from rest_framework.response import Response
from django import forms
from util import add

class InputForm(forms.Form):
    numa = forms.IntegerField(required=True)
    numb = forms.IntegerField(required=True)

@api_view(['GET'])
def add_num(req):
    form = InputForm(req.GET)
    if not form.is_valid():
        return Response({'error': ''.join(
            ['%s: %s ' % (i[0], i[1][0]) for i in form.errors.iteritems()])},
            status.HTTP_400_BAD_REQUEST)
    return Response({'result': add(form.cleaned_data['numa'], form.cleaned_data['numb'])},
            status.HTTP_200_OK)
