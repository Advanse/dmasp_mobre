<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xmi="http://schema.omg.org/spec/XMI/2.1"
	xmlns:uml="http://www.eclipse.org/uml2/3.0.0/UML"
	
>
	<xsl:output encoding="UTF-8" method="xml" indent="yes"/>
	
	<xsl:template match="/">
		<xsl:for-each select="project">
			<uml:Model>
				
				<xsl:attribute name="xmi:version">
					<xsl:text>2.1</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="xmi:id">
					<xsl:value-of select="./id"/>
					<xsl:text>_id_Model</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="name">
					<xsl:value-of select="./name"/>
				</xsl:attribute>
				
				<xsl:element name="elementImport">
					
					<xsl:attribute name="xmi:id">
						<xsl:text>_3_rOgHfvEeCZZdI_9j1gSg</xsl:text>
					</xsl:attribute>
					
					<xsl:element name="importedElement">
						
						<xsl:attribute name="xmi:type">
							<xsl:text>uml:PrimitiveType</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="href">
							<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#void</xsl:text>
						</xsl:attribute>
						
					</xsl:element>
					
				</xsl:element>
				
				<xsl:element name="elementImport">
					
					<xsl:attribute name="xmi:id">
						<xsl:text>_3_2NoHfvEeCZZdI_9j1gSg</xsl:text>
					</xsl:attribute>
					
					<xsl:element name="importedElement">
						
						<xsl:attribute name="xmi:type">
							<xsl:text>uml:PrimitiveType</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="href">
							<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#boolean</xsl:text>
						</xsl:attribute>
						
					</xsl:element>
					
				</xsl:element>
				
				<xsl:element name="elementImport">
					
					<xsl:attribute name="xmi:id">
						<xsl:text>_3_2NoXfvEeCZZdI_9j1gSg</xsl:text>
					</xsl:attribute>
					
					<xsl:element name="importedElement">
						
						<xsl:attribute name="xmi:type">
							<xsl:text>uml:PrimitiveType</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="href">
							<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#byte</xsl:text>
						</xsl:attribute>
						
					</xsl:element>
					
				</xsl:element>
				
				<xsl:element name="elementImport">
					
					<xsl:attribute name="xmi:id">
						<xsl:text>_3_20sHfvEeCZZdI_9j1gSg</xsl:text>
					</xsl:attribute>
					
					<xsl:element name="importedElement">
						
						<xsl:attribute name="xmi:type">
							<xsl:text>uml:PrimitiveType</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="href">
							<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#char</xsl:text>
						</xsl:attribute>
						
					</xsl:element>
					
				</xsl:element>
				
				<xsl:element name="elementImport">
					
					<xsl:attribute name="xmi:id">
						<xsl:text>_3_20sXfvEeCZZdI_9j1gSg</xsl:text>
					</xsl:attribute>
					
					<xsl:element name="importedElement">
						
						<xsl:attribute name="xmi:type">
							<xsl:text>uml:PrimitiveType</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="href">
							<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#double</xsl:text>
						</xsl:attribute>
						
					</xsl:element>
					
				</xsl:element>
				
				<xsl:element name="elementImport">
					
					<xsl:attribute name="xmi:id">
						<xsl:text>_3_20snfvEeCZZdI_9j1gSg</xsl:text>
					</xsl:attribute>
					
					<xsl:element name="importedElement">
						
						<xsl:attribute name="xmi:type">
							<xsl:text>uml:PrimitiveType</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="href">
							<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#float</xsl:text>
						</xsl:attribute>
						
					</xsl:element>
					
				</xsl:element>
				
				<xsl:element name="elementImport">
					
					<xsl:attribute name="xmi:id">
						<xsl:text>_3_20s3fvEeCZZdI_9j1gSg</xsl:text>
					</xsl:attribute>
					
					<xsl:element name="importedElement">
						
						<xsl:attribute name="xmi:type">
							<xsl:text>uml:PrimitiveType</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="href">
							<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#int</xsl:text>
						</xsl:attribute>
						
					</xsl:element>
					
				</xsl:element>
				
				<xsl:element name="elementImport">
					
					<xsl:attribute name="xmi:id">
						<xsl:text>_3_20tHfvEeCZZdI_9j1gSg</xsl:text>
					</xsl:attribute>
					
					<xsl:element name="importedElement">
						
						<xsl:attribute name="xmi:type">
							<xsl:text>uml:PrimitiveType</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="href">
							<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#long</xsl:text>
						</xsl:attribute>
						
					</xsl:element>
					
				</xsl:element>
				
				<xsl:element name="elementImport">
					
					<xsl:attribute name="xmi:id">
						<xsl:text>_3_20tXfvEeCZZdI_9j1gSg</xsl:text>
					</xsl:attribute>
					
					<xsl:element name="importedElement">
						
						<xsl:attribute name="xmi:type">
							<xsl:text>uml:PrimitiveType</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="href">
							<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#short</xsl:text>
						</xsl:attribute>
						
					</xsl:element>
					
				</xsl:element>
				
				<xsl:element name="elementImport">
					
					<xsl:attribute name="xmi:id">
						<xsl:text>_3_20tnfvEeCZZdI_9j1gSg</xsl:text>
					</xsl:attribute>
					
					<xsl:element name="importedElement">
						
						<xsl:attribute name="xmi:type">
							<xsl:text>uml:PrimitiveType</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="href">
							<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#String</xsl:text>
						</xsl:attribute>
						
					</xsl:element>
					
				</xsl:element>
				
				<xsl:element name="elementImport">
					
					<xsl:attribute name="xmi:id">
						<xsl:text>_3_20tnfvEeCZZdI_9j1gSg</xsl:text>
					</xsl:attribute>
					
					<xsl:element name="importedElement">
						
						<xsl:attribute name="xmi:type">
							<xsl:text>uml:PrimitiveType</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="href">
							<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#String</xsl:text>
						</xsl:attribute>
						
					</xsl:element>
					
				</xsl:element>
				
				<xsl:for-each select="./packages/package">
					<xsl:if test="./classes/class/name!=''">
						<xsl:element name="packagedElement">
						
							<xsl:attribute name="xmi:type">
								<xsl:text>uml:Package</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="xmi:id">
								<xsl:value-of select="generate-id()"/>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:value-of select="./name"/>
							</xsl:attribute>
							
							<xsl:for-each select="./classes/class">
								<xsl:element name="packagedElement">
									
									<xsl:choose>
										<xsl:when test="./isInterface='false'">
											<xsl:attribute name="xmi:type">
												<xsl:text>uml:Class</xsl:text>
											</xsl:attribute>
										</xsl:when>
										<xsl:when test="./isInterface='true'">
											<xsl:attribute name="xmi:type">
												<xsl:text>uml:Interface</xsl:text>
											</xsl:attribute>
										</xsl:when>
									</xsl:choose>
									<xsl:attribute name="xmi:id">
										<xsl:value-of select="./id"/>
									</xsl:attribute>
									<xsl:attribute name="name">
										<xsl:value-of select="./name"/>
									</xsl:attribute>
									<xsl:attribute name="isAbstract">
										<xsl:value-of select="./isAbstract"/>
									</xsl:attribute>
									<xsl:for-each select="./modifiers/modifier">
										<xsl:choose>
											<xsl:when test="./name = 'public'">
												<xsl:attribute name="visibility">
													<xsl:value-of select="./name"/>
												</xsl:attribute>
											</xsl:when>
											<xsl:when test="./name = 'private'">
												<xsl:attribute name="visibility">
													<xsl:value-of select="./name"/>
												</xsl:attribute>
											</xsl:when>
											<xsl:when test="./name = 'protected'">
												<xsl:attribute name="visibility">
													<xsl:value-of select="./name"/>
												</xsl:attribute>
											</xsl:when>
											<xsl:when test="./name = 'abstract'">
												<xsl:attribute name="isAbstract">
													<xsl:text>true</xsl:text>
												</xsl:attribute>
											</xsl:when>
											<xsl:when test="./name = 'final'">
												<xsl:attribute name="isLeaf">
													<xsl:text>true</xsl:text>
												</xsl:attribute>
											</xsl:when>
										</xsl:choose>
									</xsl:for-each>
									
									<xsl:for-each select="./concerns/concern">
											
										<xsl:attribute name="stereotypeTag">
											<xsl:text>«</xsl:text>
											<xsl:value-of select="./name"/>
											<xsl:text>»</xsl:text>
										</xsl:attribute>
												
									</xsl:for-each>
									
									<xsl:for-each select="./attributes/attribute">
										<xsl:element name="ownedAttribute">			
											<xsl:attribute name="xmi:id">
												<xsl:value-of select="./id"/>
											</xsl:attribute>
											<xsl:attribute name="name">
												<xsl:value-of select="./name"/>
											</xsl:attribute>
														
											<xsl:for-each select="./modifiers/modifier">
												<xsl:choose>
													<xsl:when test="./name='public'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='private'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='protected'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='static'">
														<xsl:attribute name="isStatic">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='final'">
														<xsl:attribute name="isLeaf">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
												</xsl:choose>
											</xsl:for-each>
											
											<xsl:for-each select="./concerns/concern">
												<xsl:attribute name="stereotypeTag">
													<xsl:text>«</xsl:text>
													<xsl:value-of select="./name"/>
													<xsl:text>»</xsl:text>
												</xsl:attribute>
											</xsl:for-each>
														
											<xsl:element name="type">
												<xsl:attribute name="xmi:type">
													<xsl:text>uml:PrimitiveType</xsl:text>
												</xsl:attribute>
												<xsl:attribute name="href">
													<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#</xsl:text>
													<xsl:value-of select="./type/id"/>
												</xsl:attribute>
											</xsl:element>
												
										</xsl:element>			
									</xsl:for-each>
									
									<xsl:for-each select="./operations/operation">
										<xsl:element name="ownedOperation">
													
											<xsl:attribute name="xmi:id">
												<xsl:value-of select="./id"/>
											</xsl:attribute>
											<xsl:attribute name="name">
												<xsl:value-of select="./name"/>
											</xsl:attribute>
														
											<xsl:for-each select="./modifiers/modifier">
												<xsl:choose>
													<xsl:when test="./name='public'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='private'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='protected'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='static'">
														<xsl:attribute name="isStatic">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='abstract'">
														<xsl:attribute name="isAbstract">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='final'">
														<xsl:attribute name="isLeaf">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
												</xsl:choose>
											</xsl:for-each>
											
											<xsl:for-each select="./concerns/concern">
											
												<xsl:attribute name="stereotypeTag">
													<xsl:text>«</xsl:text>
													<xsl:value-of select="./name"/>
													<xsl:text>»</xsl:text>
												</xsl:attribute>
												
											</xsl:for-each>
														
											<xsl:element name="ownedParameter">
														
												<xsl:attribute name="xmi:id">
													<xsl:value-of select="./returnType/id"/>
												</xsl:attribute>
												<xsl:attribute name="direction">
													<xsl:text>return</xsl:text>
												</xsl:attribute>
															
												<xsl:choose>
													<xsl:when test="./returnType/user='false'">
														<xsl:element name="type">
															<xsl:attribute name="xmi:type">
																<xsl:text>uml:PrimitiveType</xsl:text>
															</xsl:attribute>
															<xsl:attribute name="href">
																<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#</xsl:text>
																	<xsl:value-of select="./returnType/id"/>
															</xsl:attribute>
														</xsl:element>
													</xsl:when>
													<xsl:otherwise>
														<xsl:attribute name="type">
															<xsl:value-of select="./returnType/id"/>
														</xsl:attribute>
													</xsl:otherwise>
												</xsl:choose>
															
											</xsl:element>
														
											<xsl:for-each select="./parameters/parameter">
												<xsl:element name="ownedParameter">
																
													<xsl:attribute name="xmi:id">
														<xsl:value-of select="./id"/>
													</xsl:attribute>
													<xsl:attribute name="name">
														<xsl:value-of select="./name"/>
													</xsl:attribute>
																	
													<xsl:choose>
														<xsl:when test="./type/user='false'">
															<xsl:element name="type">
																<xsl:attribute name="xmi:type">
																	<xsl:text>uml:PrimitiveType</xsl:text>
																</xsl:attribute>
																<xsl:attribute name="href">
																	<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#</xsl:text>
																<xsl:value-of select="./type/id"/>
																</xsl:attribute>
															</xsl:element>
														</xsl:when>
														<xsl:otherwise>
															<xsl:attribute name="type">
																<xsl:value-of select="./type/id"/>
															</xsl:attribute>
														</xsl:otherwise>
													</xsl:choose>
																	
												</xsl:element>
																
											</xsl:for-each>
									
										</xsl:element>
									</xsl:for-each>							
									
									<xsl:for-each select="./inherit">
										<xsl:element name="generalization">
													
											<xsl:attribute name="xmi:id">
												<xsl:value-of select="generate-id()"/>
											</xsl:attribute>
											<xsl:attribute name="general">
												<xsl:value-of select="./id"/>
											</xsl:attribute>
														
										</xsl:element>
									</xsl:for-each>
									
									<xsl:for-each select="./implementedInterfaces/class">
										<xsl:element name="interfaceRealization">
										
											<xsl:attribute name="xmi:id">
												<xsl:value-of select="../../id"/>
												<xsl:text>_</xsl:text>
												<xsl:value-of select="./id"/>
											</xsl:attribute>
											<xsl:attribute name="supplier">
												<xsl:value-of select="./id"/>
											</xsl:attribute>
											<xsl:attribute name="client">
												<xsl:value-of select="../../id"/>
											</xsl:attribute>
											<xsl:attribute name="contract">
												<xsl:value-of select="./id"/>
											</xsl:attribute>
											
										</xsl:element>
									</xsl:for-each>
									
								</xsl:element>
							</xsl:for-each>
							
						</xsl:element>
					</xsl:if>
				</xsl:for-each>
				
				<xsl:for-each select="./cc/crosscuttingconcern">
					
						<xsl:element name="packagedElement">
						
							<xsl:attribute name="xmi:type">
								<xsl:text>uml:Package</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="xmi:id">
								<xsl:value-of select="generate-id()"/>
							</xsl:attribute>
							<xsl:attribute name="name">
								<xsl:value-of select="./name"/>
							</xsl:attribute>
							<xsl:attribute name="stereotypeTag">
								<xsl:text>«</xsl:text>
								<xsl:text>CrossCuttingConcern</xsl:text>
								<xsl:text>»</xsl:text>
							</xsl:attribute>
							
							<xsl:for-each select="./classes/class">
								<xsl:element name="packagedElement">
									
									<xsl:choose>
										<xsl:when test="./isInterface='false'">
											<xsl:attribute name="xmi:type">
												<xsl:text>uml:Class</xsl:text>
											</xsl:attribute>
										</xsl:when>
										<xsl:when test="./isInterface='true'">
											<xsl:attribute name="xmi:type">
												<xsl:text>uml:Interface</xsl:text>
											</xsl:attribute>
										</xsl:when>
									</xsl:choose>
									<xsl:attribute name="xmi:id">
										<xsl:value-of select="./id"/>
									</xsl:attribute>
									<xsl:attribute name="name">
										<xsl:value-of select="./name"/>
									</xsl:attribute>
									<xsl:attribute name="isAbstract">
										<xsl:value-of select="./isAbstract"/>
									</xsl:attribute>
									<xsl:for-each select="./modifiers/modifier">
										<xsl:choose>
											<xsl:when test="./name = 'public'">
												<xsl:attribute name="visibility">
													<xsl:value-of select="./name"/>
												</xsl:attribute>
											</xsl:when>
											<xsl:when test="./name = 'private'">
												<xsl:attribute name="visibility">
													<xsl:value-of select="./name"/>
												</xsl:attribute>
											</xsl:when>
											<xsl:when test="./name = 'protected'">
												<xsl:attribute name="visibility">
													<xsl:value-of select="./name"/>
												</xsl:attribute>
											</xsl:when>
											<xsl:when test="./name = 'abstract'">
												<xsl:attribute name="isAbstract">
													<xsl:text>true</xsl:text>
												</xsl:attribute>
											</xsl:when>
											<xsl:when test="./name = 'final'">
												<xsl:attribute name="isLeaf">
													<xsl:text>true</xsl:text>
												</xsl:attribute>
											</xsl:when>
										</xsl:choose>
									</xsl:for-each>
									
									<xsl:for-each select="./concerns/concern">
											
										<xsl:attribute name="stereotypeTag">
											<xsl:text>«</xsl:text>
											<xsl:value-of select="./name"/>
											<xsl:text>»</xsl:text>
										</xsl:attribute>
												
									</xsl:for-each>
									
									<xsl:for-each select="./attributes/attribute">
										<xsl:element name="ownedAttribute">			
											<xsl:attribute name="xmi:id">
												<xsl:value-of select="./id"/>
											</xsl:attribute>
											<xsl:attribute name="name">
												<xsl:value-of select="./name"/>
											</xsl:attribute>
														
											<xsl:for-each select="./modifiers/modifier">
												<xsl:choose>
													<xsl:when test="./name='public'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='private'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='protected'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='static'">
														<xsl:attribute name="isStatic">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='final'">
														<xsl:attribute name="isLeaf">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
												</xsl:choose>
											</xsl:for-each>
											
											<xsl:for-each select="./concerns/concern">
												<xsl:attribute name="stereotypeTag">
													<xsl:text>«</xsl:text>
													<xsl:value-of select="./name"/>
													<xsl:text>»</xsl:text>
												</xsl:attribute>
											</xsl:for-each>
														
											<xsl:element name="type">
												<xsl:attribute name="xmi:type">
													<xsl:text>uml:PrimitiveType</xsl:text>
												</xsl:attribute>
												<xsl:attribute name="href">
													<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#</xsl:text>
													<xsl:value-of select="./type/id"/>
												</xsl:attribute>
											</xsl:element>
												
										</xsl:element>			
									</xsl:for-each>
									
									<xsl:for-each select="./operations/operation">
										<xsl:element name="ownedOperation">
													
											<xsl:attribute name="xmi:id">
												<xsl:value-of select="./id"/>
											</xsl:attribute>
											<xsl:attribute name="name">
												<xsl:value-of select="./name"/>
											</xsl:attribute>
														
											<xsl:for-each select="./modifiers/modifier">
												<xsl:choose>
													<xsl:when test="./name='public'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='private'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='protected'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='static'">
														<xsl:attribute name="isStatic">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='abstract'">
														<xsl:attribute name="isAbstract">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='final'">
														<xsl:attribute name="isLeaf">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
												</xsl:choose>
											</xsl:for-each>
											
											<xsl:for-each select="./concerns/concern">
											
												<xsl:attribute name="stereotypeTag">
													<xsl:text>«</xsl:text>
													<xsl:value-of select="./name"/>
													<xsl:text>»</xsl:text>
												</xsl:attribute>
												
											</xsl:for-each>
														
											<xsl:element name="ownedParameter">
														
												<xsl:attribute name="xmi:id">
													<xsl:value-of select="./returnType/id"/>
												</xsl:attribute>
												<xsl:attribute name="direction">
													<xsl:text>return</xsl:text>
												</xsl:attribute>
															
												<xsl:choose>
													<xsl:when test="./returnType/user='false'">
														<xsl:element name="type">
															<xsl:attribute name="xmi:type">
																<xsl:text>uml:PrimitiveType</xsl:text>
															</xsl:attribute>
															<xsl:attribute name="href">
																<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#</xsl:text>
																	<xsl:value-of select="./returnType/id"/>
															</xsl:attribute>
														</xsl:element>
													</xsl:when>
													<xsl:otherwise>
														<xsl:attribute name="type">
															<xsl:value-of select="./returnType/id"/>
														</xsl:attribute>
													</xsl:otherwise>
												</xsl:choose>
															
											</xsl:element>
														
											<xsl:for-each select="./parameters/parameter">
												<xsl:element name="ownedParameter">
																
													<xsl:attribute name="xmi:id">
														<xsl:value-of select="./id"/>
													</xsl:attribute>
													<xsl:attribute name="name">
														<xsl:value-of select="./name"/>
													</xsl:attribute>
																	
													<xsl:choose>
														<xsl:when test="./type/user='false'">
															<xsl:element name="type">
																<xsl:attribute name="xmi:type">
																	<xsl:text>uml:PrimitiveType</xsl:text>
																</xsl:attribute>
																<xsl:attribute name="href">
																	<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#</xsl:text>
																<xsl:value-of select="./type/id"/>
																</xsl:attribute>
															</xsl:element>
														</xsl:when>
														<xsl:otherwise>
															<xsl:attribute name="type">
																<xsl:value-of select="./type/id"/>
															</xsl:attribute>
														</xsl:otherwise>
													</xsl:choose>
																	
												</xsl:element>
																
											</xsl:for-each>
									
										</xsl:element>
									</xsl:for-each>							
									
									<xsl:for-each select="./inherit">
										<xsl:element name="generalization">
													
											<xsl:attribute name="xmi:id">
												<xsl:value-of select="generate-id()"/>
											</xsl:attribute>
											<xsl:attribute name="general">
												<xsl:value-of select="./id"/>
											</xsl:attribute>
														
										</xsl:element>
									</xsl:for-each>
									
									<xsl:for-each select="./implementedInterfaces/class">
										<xsl:element name="interfaceRealization">
										
											<xsl:attribute name="xmi:id">
												<xsl:value-of select="../../id"/>
												<xsl:text>_</xsl:text>
												<xsl:value-of select="./id"/>
											</xsl:attribute>
											<xsl:attribute name="supplier">
												<xsl:value-of select="./id"/>
											</xsl:attribute>
											<xsl:attribute name="client">
												<xsl:value-of select="../../id"/>
											</xsl:attribute>
											<xsl:attribute name="contract">
												<xsl:value-of select="./id"/>
											</xsl:attribute>
											
										</xsl:element>
									</xsl:for-each>
									
								</xsl:element>
							</xsl:for-each>
							
							<xsl:for-each select="./aspects/aspect">
								<xsl:element name="packagedElement">
								
									<xsl:attribute name="xmi:type">
										<xsl:text>uml:Class</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="xmi:id">
										<xsl:value-of select="./id"/>
									</xsl:attribute>
									<xsl:attribute name="name">
										<xsl:value-of select="./name"/>
									</xsl:attribute>
									<xsl:attribute name="isAbstract">
										<xsl:value-of select="./isAbstract"/>
									</xsl:attribute>
									<xsl:attribute name="stereotypeTag">
										<xsl:text>«</xsl:text>
										<xsl:text>Aspect</xsl:text>
										<xsl:text>»</xsl:text>
									</xsl:attribute>
									<xsl:for-each select="./modifiers/modifier">
										<xsl:choose>
											<xsl:when test="./name = 'public'">
												<xsl:attribute name="visibility">
													<xsl:value-of select="./name"/>
												</xsl:attribute>
											</xsl:when>
											<xsl:when test="./name = 'private'">
												<xsl:attribute name="visibility">
													<xsl:value-of select="./name"/>
												</xsl:attribute>
											</xsl:when>
											<xsl:when test="./name = 'protected'">
												<xsl:attribute name="visibility">
													<xsl:value-of select="./name"/>
												</xsl:attribute>
											</xsl:when>
											<xsl:when test="./name = 'abstract'">
												<xsl:attribute name="isAbstract">
													<xsl:text>true</xsl:text>
												</xsl:attribute>
											</xsl:when>
											<xsl:when test="./name = 'final'">
												<xsl:attribute name="isLeaf">
													<xsl:text>true</xsl:text>
												</xsl:attribute>
											</xsl:when>
										</xsl:choose>
									</xsl:for-each>			
									
									<xsl:for-each select="./attributes/attribute">
										<xsl:element name="ownedAttribute">			
											<xsl:attribute name="xmi:id">
												<xsl:value-of select="./id"/>
											</xsl:attribute>
											<xsl:attribute name="name">
												<xsl:value-of select="./name"/>
											</xsl:attribute>
														
											<xsl:for-each select="./modifiers/modifier">
												<xsl:choose>
													<xsl:when test="./name='public'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='private'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='protected'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='static'">
														<xsl:attribute name="isStatic">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='final'">
														<xsl:attribute name="isLeaf">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
												</xsl:choose>
											</xsl:for-each>
											
											<xsl:for-each select="./concerns/concern">
												<xsl:attribute name="stereotypeTag">
													<xsl:text>«</xsl:text>
													<xsl:value-of select="./name"/>
													<xsl:text>»</xsl:text>
												</xsl:attribute>
											</xsl:for-each>
														
											<xsl:element name="type">
												<xsl:attribute name="xmi:type">
													<xsl:text>uml:PrimitiveType</xsl:text>
												</xsl:attribute>
												<xsl:attribute name="href">
													<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#</xsl:text>
													<xsl:value-of select="./type/id"/>
												</xsl:attribute>
											</xsl:element>
												
										</xsl:element>			
									</xsl:for-each>
									
									<xsl:for-each select="./operations/operation">
										<xsl:element name="ownedOperation">
													
											<xsl:attribute name="xmi:id">
												<xsl:value-of select="./id"/>
											</xsl:attribute>
											<xsl:attribute name="name">
												<xsl:value-of select="./name"/>
											</xsl:attribute>
														
											<xsl:for-each select="./modifiers/modifier">
												<xsl:choose>
													<xsl:when test="./name='public'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='private'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='protected'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='static'">
														<xsl:attribute name="isStatic">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='abstract'">
														<xsl:attribute name="isAbstract">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='final'">
														<xsl:attribute name="isLeaf">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
												</xsl:choose>
											</xsl:for-each>
											
											<xsl:for-each select="./concerns/concern">
											
												<xsl:attribute name="stereotypeTag">
													<xsl:text>«</xsl:text>
													<xsl:value-of select="./name"/>
													<xsl:text>»</xsl:text>
												</xsl:attribute>
												
											</xsl:for-each>
														
											<xsl:element name="ownedParameter">
														
												<xsl:attribute name="xmi:id">
													<xsl:value-of select="./returnType/id"/>
												</xsl:attribute>
												<xsl:attribute name="direction">
													<xsl:text>return</xsl:text>
												</xsl:attribute>
															
												<xsl:choose>
													<xsl:when test="./returnType/user='false'">
														<xsl:element name="type">
															<xsl:attribute name="xmi:type">
																<xsl:text>uml:PrimitiveType</xsl:text>
															</xsl:attribute>
															<xsl:attribute name="href">
																<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#</xsl:text>
																	<xsl:value-of select="./returnType/id"/>
															</xsl:attribute>
														</xsl:element>
													</xsl:when>
													<xsl:otherwise>
														<xsl:attribute name="type">
															<xsl:value-of select="./returnType/id"/>
														</xsl:attribute>
													</xsl:otherwise>
												</xsl:choose>
															
											</xsl:element>
														
											<xsl:for-each select="./parameters/parameter">
												<xsl:element name="ownedParameter">
																
													<xsl:attribute name="xmi:id">
														<xsl:value-of select="./id"/>
													</xsl:attribute>
													<xsl:attribute name="name">
														<xsl:value-of select="./name"/>
													</xsl:attribute>
																	
													<xsl:choose>
														<xsl:when test="./type/user='false'">
															<xsl:element name="type">
																<xsl:attribute name="xmi:type">
																	<xsl:text>uml:PrimitiveType</xsl:text>
																</xsl:attribute>
																<xsl:attribute name="href">
																	<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#</xsl:text>
																<xsl:value-of select="./type/id"/>
																</xsl:attribute>
															</xsl:element>
														</xsl:when>
														<xsl:otherwise>
															<xsl:attribute name="type">
																<xsl:value-of select="./type/id"/>
															</xsl:attribute>
														</xsl:otherwise>
													</xsl:choose>
																	
												</xsl:element>				
											</xsl:for-each>
									
										</xsl:element>
									</xsl:for-each>							
									
									<xsl:for-each select="./inherit">
										<xsl:element name="generalization">
													
											<xsl:attribute name="xmi:id">
												<xsl:value-of select="generate-id()"/>
											</xsl:attribute>
											<xsl:attribute name="general">
												<xsl:value-of select="./id"/>
											</xsl:attribute>
														
										</xsl:element>
									</xsl:for-each>
									
									<xsl:for-each select="./implementedInterfaces/class">
										<xsl:element name="interfaceRealization">
										
											<xsl:attribute name="xmi:id">
												<xsl:value-of select="../../id"/>
												<xsl:text>_</xsl:text>
												<xsl:value-of select="./id"/>
											</xsl:attribute>
											<xsl:attribute name="supplier">
												<xsl:value-of select="./id"/>
											</xsl:attribute>
											<xsl:attribute name="client">
												<xsl:value-of select="../../id"/>
											</xsl:attribute>
											<xsl:attribute name="contract">
												<xsl:value-of select="./id"/>
											</xsl:attribute>
											
										</xsl:element>
									</xsl:for-each>
									
									<xsl:for-each select="./pointcuts/pointcut">
										<xsl:element name="ownedAttribute">
											
											<xsl:attribute name="xmi:id">
												<xsl:value-of select="./id"/>
											</xsl:attribute>
											<xsl:attribute name="name">
												<xsl:value-of select="./name"/>
											</xsl:attribute>
											<xsl:attribute name="stereotypeTag">
												<xsl:text>«</xsl:text>
												<xsl:value-of select="./type/id"/>
												<xsl:text>»</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="isAbstract">
												<xsl:value-of select="./isAbstract"/>
											</xsl:attribute>
											<xsl:attribute name="taggedValue">
												
												<xsl:choose>
														<xsl:when test="./type/name='Call'">
															<xsl:text>&#123;operation = </xsl:text>
															<xsl:for-each select="./operations/operation">
																<xsl:value-of select="./name"/>
																<xsl:text> </xsl:text>
															</xsl:for-each>
															<xsl:text>&#125;</xsl:text>
														</xsl:when>
														<xsl:when test="./type/name='ExecutionPointCut'">
															<xsl:text>&#123;operation = </xsl:text>
															<xsl:for-each select="./operations/operation">
																<xsl:value-of select="./name"/>
																<xsl:text> </xsl:text>
															</xsl:for-each>
															<xsl:text>&#125;</xsl:text>
														</xsl:when>
														<xsl:when test="./type/name='targetPointCut'">
															<xsl:text>&#123;argNames = </xsl:text>
															<xsl:for-each select="./targets/class">
																<xsl:value-of select="./name"/>
																<xsl:text> </xsl:text>
															</xsl:for-each>
															<xsl:text>&#125;</xsl:text>
														</xsl:when>
													</xsl:choose>

											</xsl:attribute>
											<xsl:for-each select="./modifiers/modifier">
												<xsl:choose>
													<xsl:when test="./name='public'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='private'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='protected'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='static'">
														<xsl:attribute name="isStatic">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='abstract'">
														<xsl:attribute name="isAbstract">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='final'">
														<xsl:attribute name="isLeaf">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
												</xsl:choose>
											</xsl:for-each>
											
										</xsl:element>
									</xsl:for-each>
									
									<xsl:for-each select="./pointcuts/introductionAttribute">
										<xsl:element name="ownedAttribute">
											
											<xsl:attribute name="xmi:id">
												<xsl:value-of select="./id"/>
											</xsl:attribute>
											<xsl:attribute name="name">
												<xsl:value-of select="./attributes/attribute/name"/>
											</xsl:attribute>
											<xsl:attribute name="stereotypeTag">
												<xsl:text>«</xsl:text>
												<xsl:value-of select="./type/id"/>
												<xsl:text>»</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="isAbstract">
												<xsl:value-of select="./isAbstract"/>
											</xsl:attribute>
											<xsl:attribute name="taggedValue">
												<xsl:text>&#123;onType = "</xsl:text>
												<xsl:for-each select="./targets/class">
													<xsl:value-of select="./name"/>
													<xsl:text> </xsl:text>
												</xsl:for-each>
												<xsl:text>&#125;</xsl:text>
											</xsl:attribute>
											<xsl:for-each select="./attributes/attribute/modifiers/modifier">
												<xsl:choose>
													<xsl:when test="./name='public'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='private'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='protected'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='static'">
														<xsl:attribute name="isStatic">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='abstract'">
														<xsl:attribute name="isAbstract">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='final'">
														<xsl:attribute name="isLeaf">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
												</xsl:choose>
											</xsl:for-each>
											
											<xsl:for-each select="./attributes/attribute/concerns/concern">
											
												<xsl:attribute name="stereotypeTag">
													<xsl:text>«</xsl:text>
													<xsl:value-of select="./name"/>
													<xsl:text>»</xsl:text>
												</xsl:attribute>
												
											</xsl:for-each>
											
											<xsl:element name="type">
												<xsl:attribute name="xmi:type">
													<xsl:text>uml:PrimitiveType</xsl:text>
												</xsl:attribute>
												<xsl:attribute name="href">
													<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#</xsl:text>
													<xsl:value-of select="./attributes/attribute/type/id"/>
												</xsl:attribute>
											</xsl:element>
											
											
										</xsl:element>
									</xsl:for-each>
									
									<xsl:for-each select="./pointcuts/introductionMethod">
										<xsl:element name="ownedOperation">
											
											<xsl:attribute name="xmi:id">
												<xsl:value-of select="./id"/>
											</xsl:attribute>
											<xsl:attribute name="name">
												<xsl:value-of select="./operations/operation/name"/>
											</xsl:attribute>
											<xsl:attribute name="stereotypeTag">
												<xsl:text>«</xsl:text>
												<xsl:value-of select="./type/id"/>
												<xsl:text>»</xsl:text>
											</xsl:attribute>
											<xsl:attribute name="isAbstract">
												<xsl:value-of select="./isAbstract"/>
											</xsl:attribute>
											<xsl:attribute name="taggedValue">
												<xsl:text>&#123;onType = "</xsl:text>
												<xsl:for-each select="./targets/class">
													<xsl:value-of select="./name"/>
													<xsl:text> </xsl:text>
												</xsl:for-each>
												<xsl:text>&#125;</xsl:text>
											</xsl:attribute>
											<xsl:for-each select="./operataions/operation/modifiers/modifier">
												<xsl:choose>
													<xsl:when test="./name='public'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='private'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='protected'">
														<xsl:attribute name="visibility">
															<xsl:value-of select="./name"/>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='static'">
														<xsl:attribute name="isStatic">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='abstract'">
														<xsl:attribute name="isAbstract">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
													<xsl:when test="./name='final'">
														<xsl:attribute name="isLeaf">
															<xsl:text>true</xsl:text>
														</xsl:attribute>
													</xsl:when>
												</xsl:choose>
											</xsl:for-each>
											
											<xsl:for-each select="./operations/operation/concerns/concern">
											
												<xsl:attribute name="stereotypeTag">
													<xsl:text>«</xsl:text>
													<xsl:value-of select="./name"/>
													<xsl:text>»</xsl:text>
												</xsl:attribute>
												
											</xsl:for-each>
														
											<xsl:element name="ownedParameter">
														
												<xsl:attribute name="xmi:id">
													<xsl:value-of select="./operations/operation/returnType/id"/>
												</xsl:attribute>
												<xsl:attribute name="direction">
													<xsl:text>return</xsl:text>
												</xsl:attribute>
															
												<xsl:choose>
													<xsl:when test="./operations/operation/returnType/user='false'">
														<xsl:element name="type">
															<xsl:attribute name="xmi:type">
																<xsl:text>uml:PrimitiveType</xsl:text>
															</xsl:attribute>
															<xsl:attribute name="href">
																<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#</xsl:text>
																	<xsl:value-of select="./returnType/id"/>
															</xsl:attribute>
														</xsl:element>
													</xsl:when>
													<xsl:otherwise>
														<xsl:attribute name="type">
															<xsl:value-of select="./operations/operation/returnType/id"/>
														</xsl:attribute>
													</xsl:otherwise>
												</xsl:choose>
															
											</xsl:element>
														
											<xsl:for-each select="./operation/operations/parameters/parameter">
												<xsl:element name="ownedParameter">
																
													<xsl:attribute name="xmi:id">
														<xsl:value-of select="./id"/>
													</xsl:attribute>
													<xsl:attribute name="name">
														<xsl:value-of select="./name"/>
													</xsl:attribute>
																	
													<xsl:choose>
														<xsl:when test="./type/user='false'">
															<xsl:element name="type">
																<xsl:attribute name="xmi:type">
																	<xsl:text>uml:PrimitiveType</xsl:text>
																</xsl:attribute>
																<xsl:attribute name="href">
																	<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#</xsl:text>
																<xsl:value-of select="./type/id"/>
																</xsl:attribute>
															</xsl:element>
														</xsl:when>
														<xsl:otherwise>
															<xsl:attribute name="type">
																<xsl:value-of select="./type/id"/>
															</xsl:attribute>
														</xsl:otherwise>
													</xsl:choose>
																	
												</xsl:element>
																
											</xsl:for-each>
											
											
											
										</xsl:element>
									</xsl:for-each>
									
									<xsl:for-each select="./advices/advice">
										<xsl:element name="ownedOperation">
											
											<xsl:attribute name="xmi:id">
												<xsl:value-of select="./id"/>
											</xsl:attribute>
											<xsl:attribute name="name">
												<xsl:value-of select="./name"/>
											</xsl:attribute>
											<xsl:attribute name="stereotypeTag">
												<xsl:text>«</xsl:text>
												<xsl:text>Advice</xsl:text>
												<xsl:text>»</xsl:text>
											</xsl:attribute>
											
											<xsl:attribute name="taggedValue">
												<xsl:text>&#123;adviceExecution = </xsl:text>
												<xsl:value-of select="./adType"/>
												<xsl:text>, pointCut = </xsl:text>
												<xsl:value-of select="./pointcut/name"/>
												<xsl:text>&#125; </xsl:text>
											</xsl:attribute>
											
											<xsl:element name="ownedParameter">
														
												<xsl:attribute name="xmi:id">
													<xsl:value-of select="./returnType/id"/>
												</xsl:attribute>
												<xsl:attribute name="direction">
													<xsl:text>return</xsl:text>
												</xsl:attribute>
															
												<xsl:choose>
													<xsl:when test="./returnType/user='false'">
														<xsl:element name="type">
															<xsl:attribute name="xmi:type">
																<xsl:text>uml:PrimitiveType</xsl:text>
															</xsl:attribute>
															<xsl:attribute name="href">
																<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#</xsl:text>
																	<xsl:value-of select="./returnType/id"/>
															</xsl:attribute>
														</xsl:element>
													</xsl:when>
													<xsl:otherwise>
														<xsl:attribute name="type">
															<xsl:value-of select="./returnType/id"/>
														</xsl:attribute>
													</xsl:otherwise>
												</xsl:choose>
															
											</xsl:element>
											
											<xsl:for-each select="./parameters/parameter">
												<xsl:element name="ownedParameter">
																
													<xsl:attribute name="xmi:id">
														<xsl:value-of select="./id"/>
													</xsl:attribute>
													<xsl:attribute name="name">
														<xsl:value-of select="./name"/>
													</xsl:attribute>
																	
													<xsl:choose>
														<xsl:when test="./type/user='false'">
															<xsl:element name="type">
																<xsl:attribute name="xmi:type">
																	<xsl:text>uml:PrimitiveType</xsl:text>
																</xsl:attribute>
																<xsl:attribute name="href">
																	<xsl:text>platform:/plugin/br.ufscar.dc.mvcase.diagram.def/libraries/UML_LIBRARIES/JavaPrimitiveTypes.library.uml#</xsl:text>
																<xsl:value-of select="./type/id"/>
																</xsl:attribute>
															</xsl:element>
														</xsl:when>
														<xsl:otherwise>
															<xsl:attribute name="type">
																<xsl:value-of select="./type/id"/>
															</xsl:attribute>
														</xsl:otherwise>
													</xsl:choose>
																	
												</xsl:element>			
											</xsl:for-each>
											
										</xsl:element>
									</xsl:for-each>
									
									<xsl:for-each select="./declareParents/declareparents">
										<xsl:attribute name="taggedValue">
											<xsl:choose>
												<xsl:when test="./dpType='extends'">
													<xsl:text>{declareParents =</xsl:text>
												</xsl:when>
												<xsl:when test="./dpType='implements'">
													<xsl:text>{declareImplements = </xsl:text>
												</xsl:when>
											</xsl:choose>
											<xsl:value-of select="./clBase/name"/>
											<xsl:text>--></xsl:text>
											<xsl:for-each select="./sonClasses/class">
												<xsl:value-of select="./name"/>
												<xsl:text> </xsl:text>
											</xsl:for-each>
										</xsl:attribute>
									</xsl:for-each>
									
								</xsl:element>
							</xsl:for-each>
						</xsl:element>
					
				</xsl:for-each>

				<xsl:for-each select="./associations/association">
					<xsl:element name="packagedElement">
								
						<xsl:attribute name="xmi:type">
							<xsl:text>uml:Association</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="xmi:id">
							<xsl:value-of select="./id"/>
						</xsl:attribute>
						<xsl:attribute name="memberEnd">
							<xsl:text>associacao_</xsl:text>
							<xsl:value-of select="./idClass1"/>
							<xsl:text> </xsl:text>
							<xsl:text>associacao_</xsl:text>
							<xsl:value-of select="./idClass2"/>
						</xsl:attribute>
										
						<xsl:element name="ownedEnd">
						
							<xsl:attribute name="xmi:id">
								<xsl:text>associacao_</xsl:text>
							<xsl:value-of select="./idClass1"/>
							</xsl:attribute>
							<xsl:attribute name="type">
								<xsl:value-of select="./idClass1"/>
							</xsl:attribute>
							<xsl:attribute name="association">
								<xsl:value-of select="./id"/>
							</xsl:attribute>
											
							<xsl:element name="upperValue">
											
								<xsl:attribute name="xmi:type">
									<xsl:text>uml:LiteralUnlimitedNatural</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="xmi:id">
									<xsl:value-of select="generate-id()"/>
								</xsl:attribute>
								<xsl:attribute name="value">
									<xsl:text>1</xsl:text>
								</xsl:attribute>
												
							</xsl:element>
											
							<xsl:element name="lowerValue">
											
								<xsl:attribute name="xmi:type">
									<xsl:text>uml:LiteralInteger</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="xmi:id">
									<xsl:value-of select="generate-id()"/>
								</xsl:attribute>
								<xsl:attribute name="value">
									<xsl:text>1</xsl:text>
								</xsl:attribute>
												
							</xsl:element>
											
						</xsl:element>
										
						<xsl:element name="ownedEnd">
										
							<xsl:attribute name="xmi:id">
								<xsl:text>associacao_</xsl:text>
								<xsl:value-of select="./idClass2"/>
							</xsl:attribute>
							<xsl:attribute name="type">
								<xsl:value-of select="./idClass2"/>
							</xsl:attribute>
							<xsl:attribute name="association">
								<xsl:value-of select="./id"/>
							</xsl:attribute>
											
							<xsl:element name="upperValue">
											
								<xsl:attribute name="xmi:type">
									<xsl:text>uml:LiteralUnlimitedNatural</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="xmi:id">
									<xsl:value-of select="generate-id()"/>
								</xsl:attribute>
								<xsl:attribute name="value">
									<xsl:text>1</xsl:text>
								</xsl:attribute>
												
							</xsl:element>
											
							<xsl:element name="lowerValue">
											
								<xsl:attribute name="xmi:type">
									<xsl:text>uml:LiteralInteger</xsl:text>
								</xsl:attribute>
								<xsl:attribute name="xmi:id">
									<xsl:value-of select="generate-id()"/>
								</xsl:attribute>
								<xsl:attribute name="value">
									<xsl:text>1</xsl:text>
								</xsl:attribute>
												
							</xsl:element>
								
						</xsl:element>
							
					</xsl:element>			
				</xsl:for-each>
				
			</uml:Model>
		
		</xsl:for-each>

	</xsl:template>

</xsl:stylesheet>