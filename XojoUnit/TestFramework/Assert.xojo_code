#tag Class
Protected Class Assert
	#tag Method, Flags = &h0
		Sub AreDifferent(expected As Object, actual As Object, message As String = "")
		  If Not (expected Is actual) Then
		    Pass(message)
		  Else
		    Fail("オブジェクトが異なっています。", message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Color, actual As Color, message As String = "")
		  Dim expectedColor, actualColor As String
		  
		  If expected = actual Then
		    Pass(message)
		  Else
		    expectedColor = "RGB(" + Str(expected.Red) + ", " + Str(expected.Green) + ", " + Str(expected.Blue) + ")"
		    actualColor = "RGB(" + Str(actual.Red) + ", " + Str(actual.Green) + ", " + Str(actual.Blue) + ")"
		    Fail(FailEqualMessage(expectedColor, actualColor), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Currency, actual As Currency, message As String = "")
		  If expected = actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(Str(expected), Str(actual)), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Date, actual As Date, message As String = "")
		  If expected.TotalSeconds = actual.TotalSeconds Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected.ShortDate + " " + expected.LongTime, actual.ShortDate + " " + actual.LongTime), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected() As Double, actual() As Double, message As String = "")
		  Dim expectedSize, actualSize As Double
		  
		  expectedSize = UBound(expected)
		  actualSize = UBound(actual)
		  
		  If expectedSize <> actualSize Then
		    Fail( "期待した Integer 配列 Ubound <" + Str(expectedSize) + _
		    ">の代わりに <" + Str(actualSize) + ">。", _
		    message)
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If expected(i) <> actual(i) Then
		      Fail( FailEqualMessage("配列(" + Str(i) + ") = '" + Str(expected(i)) + "'", _
		      "配列(" + Str(i) + ") = '" + Str(actual(i)) + "'"), _
		      message)
		      Return
		    End If
		  Next
		  
		  Pass(message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Double, actual As Double, tolerance As Double, message As String = "")
		  Dim diff As Double
		  
		  diff = Abs(expected - actual)
		  If diff <= (Abs(tolerance) + 0.00000001) Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(Format(expected, "-#########.##########"), Format(actual, "-#########.##########")), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Double, actual As Double, message As String = "")
		  Dim tolerance As Double = 0.00000001
		  
		  AreEqual(expected, actual, tolerance, message)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Int64, actual As Int64, message As String = "")
		  If expected = actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(Str(expected), Str(actual)), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected() As Integer, actual() As Integer, message As String = "")
		  Dim expectedSize, actualSize As Integer
		  
		  expectedSize = UBound(expected)
		  actualSize = UBound(actual)
		  
		  If expectedSize <> actualSize Then
		    Fail( "期待した Integer 配列 Ubound" + Str(expectedSize) + _
		    "> の代わりに <" + Str(actualSize) + ">。", _
		    message)
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If expected(i) <> actual(i) Then
		      Fail( FailEqualMessage("配列(" + Str(i) + ") = '" + Str(expected(i)) + "'", _
		      "配列(" + Str(i) + ") = '" + Str(actual(i)) + "'"), _
		      message)
		      Return
		    End If
		  Next
		  
		  Pass(message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Integer, actual As Integer, message As String = "")
		  If expected = actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(Str(expected), Str(actual)), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected() As String, actual() As String, message As String = "")
		  Dim expectedSize, actualSize As Integer
		  
		  expectedSize = UBound(expected)
		  actualSize = UBound(actual)
		  
		  If expectedSize <> actualSize Then
		    Fail( "期待した String 配列 Ubound<" + Str(expectedSize) + _
		    "> の代わりに <" + Str(actualSize) + ">。", _
		    message)
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If expected(i) <> actual(i) Then
		      Fail( FailEqualMessage("配列(" + Str(i) + ") = '" + expected(i) + "'", _
		      "配列(" + Str(i) + ") = '" + actual(i) + "'"), _
		      message)
		      Return
		    End If
		  Next
		  
		  Pass(message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As String, actual As String, message As String = "")
		  // 大文字・小文字を区別していない比較です。
		  
		  If expected = actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected, actual), message )
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreSame(expected As Object, actual As Object, message As String = "")
		  If expected Is actual Then
		    Pass(message)
		  Else
		    Fail("オブジェクトが異なっています。", message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreSame(expected As String, actual As String, message As String = "")
		  If StrComp(expected, actual, 0) = 0 Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected, actual), message )
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  Group = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Fail(failMessage As String, message As String = "")
		  Failed = True
		  Group.CurrentTestResult.Result = TestResult.Failed
		  
		  If Group.CurrentTestResult.Message = "" Then
		    Group.CurrentTestResult.Message = message + ": " + failMessage
		  Else
		    Group.CurrentTestResult.Message = Group.CurrentTestResult.Message + EndOfLine + message + ": " + failMessage
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FailEqualMessage(expected As String, actual As String) As String
		  Dim message As String
		  
		  message = "期待した<" + expected + "> の代わりに <" + actual + ">。"
		  
		  Return message
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsFalse(condition As Boolean, message As String = "")
		  If condition Then
		    Fail("期待した<false> の代わりに <true>。", message)
		  Else
		    Pass(message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsNil(anObject As Object, message As String = "")
		  If anObject = Nil Then
		    Pass(message)
		  Else
		    Fail("オブジェクトを <nil> と期待しています。", message)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsNotNil(anObject As Object, message As String = "")
		  If anObject <> Nil Then
		    Pass(message)
		  Else
		    Fail("<nil>ではない値を期待しました。", message)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsTrue(condition As Boolean, message As String = "")
		  If condition Then
		    Pass(message)
		  Else
		    Fail("期待した<true>の代わりに<false>。", message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Message(msg As String)
		  If Group.CurrentTestResult.Message = "" Then
		    Group.CurrentTestResult.Message = msg
		  Else
		    Group.CurrentTestResult.Message = Group.CurrentTestResult.Message + EndOfLine + msg
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pass(message As String = "")
		  Failed = False
		  If Group.CurrentTestResult.Result <> TestResult.Failed Then
		    Group.CurrentTestResult.Result = TestResult.Passed
		    Group.CurrentTestResult.Message = message
		  End If
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Failed As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mGroupWeakRef Is Nil Then
			    Return Nil
			  Else
			    Return TestGroup(mGroupWeakRef.Value)
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGroupWeakRef = New WeakRef(value)
			End Set
		#tag EndSetter
		Group As TestGroup
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mGroupWeakRef As WeakRef
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Failed"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
