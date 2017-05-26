#tag Class
Protected Class URL
	#tag Method, Flags = &h0
		Sub constructor(url as string)
		  Self.parse(url)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getPath(url as String) As string
		  Dim rg As New RegEx
		  Dim myMatch As RegExMatch
		  
		  rg.SearchPattern = "^.*?:\/\/\/?.*?\/(.*)$"
		  myMatch = rg.Search(url)
		  if myMatch = nil then
		    return ""
		  else
		    return "/" + myMatch.SubExpressionString(1)
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub parse(url as string)
		  url = Self.updateURL(url)
		  Dim path as string = Self.getPath(url)
		  
		  Self.parseDomain(url)
		  Self.parseSchema(url)
		  Self.parsePath(path)
		  Self.parseQuery(path)
		  Self.parseHash(path)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub parseDomain(url as string)
		  Dim rg As New RegEx
		  Dim myMatch As RegExMatch
		  
		  // /path
		  rg.SearchPattern = "^\/.*$"
		  myMatch = rg.Search(url)
		  if myMatch <> nil then
		    Self.domain = ""
		    return
		  end if
		  
		  rg.SearchPattern = "^.*?:\/\/\/?(.*?)\/(.*)$"
		  myMatch = rg.Search(url)
		  Dim domain as string = myMatch.SubExpressionString(1)
		  rg.SearchPattern = "^(.*?):(.*?)@(.*?)$"
		  myMatch = rg.Search(domain)
		  if myMatch = nil then
		    Self.domain = domain
		    return
		  end if
		  
		  Self.userName = myMatch.SubExpressionString(1)
		  Self.password = myMatch.SubExpressionString(2)
		  domain = myMatch.SubExpressionString(3)
		  rg.SearchPattern = "^(.*?):(.*?)$"
		  myMatch = rg.Search(domain)
		  if myMatch = nil then
		    Self.domain = domain
		  else
		    Self.domain = myMatch.SubExpressionString(1)
		    Self.port       = myMatch.SubExpressionString(2).Val
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub parseHash(queryString as string)
		  Dim rg As New RegEx
		  Dim myMatch As RegExMatch
		  
		  rg.SearchPattern = "^(.*)#(.*)$"
		  myMatch = rg.Search(queryString)
		  
		  if myMatch = nil then
		    return
		  end if
		  
		  Dim hashes() as string = myMatch.SubExpressionString(2).Split("&")
		  Dim param() as string
		  Self.hashes = new Dictionary
		  For i As Integer = 0 To hashes.Ubound
		    param = hashes(i).split("=")
		    if param.Ubound = 0 then
		      Self.hashes.value(hashes(i)) = true
		    else
		      Self.hashes.value(param(0)) = param(1)
		    end if
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub parsePath(path as string)
		  Dim rg As New RegEx
		  Dim myMatch As RegExMatch
		  
		  rg.SearchPattern = "(\?|#).*$"
		  rg.ReplacementPattern = ""
		  
		  Self.path = rg.Replace(path)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub parseQuery(queryString as string)
		  Dim rg As New RegEx
		  Dim myMatch As RegExMatch
		  
		  rg.SearchPattern = "^.*\?(.*?)(#|$)"
		  myMatch = rg.Search(queryString)
		  
		  if myMatch = nil then
		    return
		  end if
		  
		  Dim queries() as string = myMatch.SubExpressionString(1).Split("&")
		  Dim param() as string
		  
		  Self.params = new Dictionary
		  
		  For i As Integer = 0 To queries.Ubound
		    param = queries(i).split("=")
		    if param.Ubound = 0 then
		      Self.params.value(queries(i)) = true
		    else
		      Self.params.value(param(0)) = param(1)
		    end if
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub parseSchema(url as string)
		  Dim rg As New RegEx
		  Dim myMatch As RegExMatch
		  rg.SearchPattern = "^(.*):\/\/\/?(.*)$"
		  myMatch = rg.Search(url)
		  
		  if myMatch = nil then
		    Self.shema = url
		    return
		  else
		    Self.shema = myMatch.SubExpressionString(1)
		    if Self.shema = "xojo" then
		      Self.isXojo = true
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function updateURL(url as string) As String
		  Dim rg As New RegEx
		  Dim myMatch As RegExMatch
		  
		  rg.SearchPattern = "^\/.*$"
		  myMatch = rg.Search(url)
		  if myMatch <> nil then
		    return url
		  end if
		  
		  // //:www.example.com
		  rg.SearchPattern = "^:\/\/.*$"
		  myMatch = rg.Search(url)
		  if myMatch <> nil then
		    url = Self.domain + url
		  end if
		  
		  // www.example.com
		  rg.SearchPattern = "^.+:\/\/\/?.*$"
		  myMatch = rg.Search(url)
		  if myMatch = nil then
		    url = Self.shema + "://" + url
		  end if
		  
		  return url
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		domain As string
	#tag EndProperty

	#tag Property, Flags = &h0
		hashes As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		isXojo As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		params As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		password As String
	#tag EndProperty

	#tag Property, Flags = &h0
		path As String
	#tag EndProperty

	#tag Property, Flags = &h0
		port As Integer = 80
	#tag EndProperty

	#tag Property, Flags = &h0
		shema As String = "http"
	#tag EndProperty

	#tag Property, Flags = &h0
		userName As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="domain"
			Group="Behavior"
			Type="string"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isXojo"
			Group="Behavior"
			Type="Boolean"
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
			Name="password"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="path"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="shema"
			Group="Behavior"
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
		#tag ViewProperty
			Name="userName"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
