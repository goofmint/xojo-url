#tag Class
Protected Class XojoUnitTests
Inherits TestGroup
	#tag Method, Flags = &h0
		Sub AssertDomainTest()
		  Dim url as URL
		  url = new URL("http://rob:abcd1234@www.example.co.uk/path/index.html?query1=test&silly=willy&field[0]=zero&field[2]=two#test=hash&chucky=cheese")
		  
		  Assert.AreSame(url.domain, "www.example.co.uk")
		  Assert.AreSame(url.userName, "rob")
		  Assert.AreSame(url.password, "abcd1234")
		  Assert.AreEqual(url.port, 80)
		  
		  url = new URL("http://www.example.co.uk/path/index.html?query1=test&silly=willy&field[0]=zero&field[2]=two#test=hash&chucky=cheese")
		  
		  Assert.AreSame(url.domain, "www.example.co.uk")
		  Assert.AreSame(url.userName, "")
		  Assert.AreSame(url.password, "")
		  
		  url = new URL("/path/index.html?query1=test&silly=willy&field[0]=zero&field[2]=two#test=hash&chucky=cheese")
		  Assert.AreSame(url.domain, "")
		  
		  url = new URL("http://rob:abcd1234@www.example.co.uk:8080/path/index.html?query1=test&silly=willy&field[0]=zero&field[2]=two#test=hash&chucky=cheese")
		  
		  Assert.AreSame(url.domain, "www.example.co.uk")
		  Assert.AreEqual(url.port, 8080)
		  
		  url = new URL("rob:abcd1234@www.example.co.uk:8080/path/index.html?query1=test&silly=willy&field[0]=zero&field[2]=two#test=hash&chucky=cheese")
		  
		  Assert.AreSame(url.domain, "www.example.co.uk")
		  Assert.AreSame(url.shema, "http")
		  Assert.AreEqual(url.port, 8080)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssertFailedTest()
		  Assert.IsTrue(True)
		  Assert.IsFalse(Assert.Failed)
		  
		  If CurrentTestResult.Result = TestResult.Passed Then
		    Assert.IsTrue(False)
		    CurrentTestResult.Result = TestResult.Passed
		    Assert.IsTrue(Assert.Failed)
		    Assert.IsFalse(Assert.Failed)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssertHashTest()
		  Dim url as URL
		  url = new URL("http://www.example.co.uk/path/index.html?query1=test&silly=willy&field[0]=zero&field[2]=two#test=hash&chucky=cheese")
		  
		  Assert.AreEqual(url.hashes.Keys.Ubound, 1)
		  Assert.AreSame(url.hashes.Value("test"), "hash")
		  
		  url = new URL("http://www.example.co.uk/path/index.html?query1=test&silly=willy&field[0]=zero&field[2]=two")
		  
		  Assert.IsNil(Object(url.hashes))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssertPathTest()
		  Dim url as URL
		  url = new URL("http://www.example.co.uk/path/index.html?query1=test&silly=willy&field[0]=zero&field[2]=two#test=hash&chucky=cheese")
		  
		  Assert.AreSame(url.path, "/path/index.html")
		  
		  url = new URL("http://www.example.co.uk/")
		  
		  Assert.AreSame(url.path, "/")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssertQueryTest()
		  Dim url as URL
		  url = new URL("http://www.example.co.uk/path/index.html?query1=test&silly=willy&field[0]=zero&field[2]=two#test=hash&chucky=cheese")
		  
		  Assert.AreEqual(url.params.Keys.Ubound, 3)
		  Assert.AreSame(url.params.Value("query1"), "test")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssertSchemaTest()
		  Dim url as URL
		  url = new URL("http://rob:abcd1234@www.example.co.uk/path/index.html?query1=test&silly=willy&field[0]=zero&field[2]=two#test=hash&chucky=cheese")
		  
		  Assert.AreSame(url.shema, "http")
		  
		  url = new URL("https://rob:abcd1234@www.example.co.uk/path/index.html?query1=test&silly=willy&field[0]=zero&field[2]=two#test=hash&chucky=cheese")
		  
		  Assert.AreSame(url.shema, "https")
		  
		  url = new URL("file:///rob:abcd1234@www.example.co.uk/path/index.html?query1=test&silly=willy&field[0]=zero&field[2]=two#test=hash&chucky=cheese")
		  
		  Assert.AreSame(url.shema, "file")
		  
		  
		  url = new URL("xojo://rob:abcd1234@www.example.co.uk/path/index.html?query1=test&silly=willy&field[0]=zero&field[2]=two#test=hash&chucky=cheese")
		  
		  Assert.AreSame(url.shema, "xojo")
		  Assert.IsTrue(url.isXojo)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PassTest()
		  Assert.Pass("成功しました！")
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="FailedTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IncludeGroup"
			Group="Behavior"
			InitialValue="True"
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
			Name="PassedTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SkippedTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TestCount"
			Group="Behavior"
			Type="Integer"
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
